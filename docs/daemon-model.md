# Daemon Model

StackMCP runs as a long-lived background process (a daemon) on your local machine. This section explains the architecture and how it differs from running one-off tool integrations.

## Why a daemon?

A persistent daemon lets StackMCP maintain connections to services and tools across multiple AI assistant interactions. This means:

- **Shared connections** — database pools, API sessions, and file watchers are reused across requests instead of being created and torn down each time
- **Background workflows** — the daemon can schedule and execute workflows on a timer or in response to events, not just when a user sends a message
- **Stateful operations** — long-running tasks (data syncs, batch processing) can run in the background and report progress back to the AI assistant

## Architecture sketch

```
┌─────────────────────────────────┐
│  AI Assistant (Claude, etc.)    │
│  (MCP client)                   │
└─────────┬───────────────────────┘
          │  MCP protocol
          ▼
┌─────────────────────────────────┐
│  StackMCP Daemon                │
│                                 │
│  ┌─────────┐  ┌──────────────┐ │
│  │ Tool    │  │ Workflow     │ │
│  │ Manager │  │ Engine       │ │
│  └────┬────┘  └──────┬───────┘ │
│       │               │        │
│  ┌────▼───────────────▼───────┐│
│  │      Connection Pool       ││
│  │  (DB, API, filesystem)     ││
│  └────────────────────────────┘│
└─────────────────────────────────┘
```

## Tool Manager

The Tool Manager handles registration, discovery, and invocation of tools. Each tool wraps a specific capability — running a SQL query, fetching from an API, reading a file. Tools are defined declaratively and can be added or removed without restarting the daemon.

## Workflow Engine

The Workflow Engine interprets workflow templates (JSON files that define a sequence of steps) and executes them. Each step calls one or more tools, passing outputs from previous steps as inputs. The engine handles ordering, error handling, and retries.

## Connection Pool

The daemon maintains a pool of persistent connections to services and data sources. This avoids the overhead of re-authenticating or reconnecting on every request. Connections are managed through configurable lifecycle policies — the daemon can keep them alive indefinitely, expire them after inactivity, or refresh them on a schedule.

## Local only

StackMCP is designed to run on your local machine only. It does not expose your tools or data to the network. All communication happens over localhost through the MCP protocol.
