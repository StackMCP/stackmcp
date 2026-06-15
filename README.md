# StackMCP

StackMCP is the execution layer for MCP workflows — a local CLI and daemon that connects AI tools to your apps, APIs, and MCP servers.

No repo clone needed. Install once, run from anywhere.

## Install

```bash
npm install -g stackmcp
```

This installs the `stackmcp` CLI globally. The daemon (`stackmcp-daemon`) is downloaded automatically on first use.

## Quickstart

```bash
# Initialize your workspace
stackmcp init

# List available stacks
stackmcp stacks

# Run a stack
stackmcp run youtube-to-obsidian --url "https://www.youtube.com/watch?v=VIDEO_ID"

# Get stack recommendations
stackmcp recommendations

# View execution history
stackmcp history

# Check daemon status
stackmcp daemon status
```

If the daemon is not running, the CLI starts it automatically. First run may take a few seconds because `npx` downloads `stackmcp-daemon`.

## Architecture

| Package | Role |
|---|---|
| **stackmcp** | CLI installed globally from npm. Thin client that discovers, validates, and invokes stacks. |
| **stackmcp-daemon** | Local daemon started automatically via `npx`. Connects to MCP servers, runs stacks, tracks execution history, powers recommendations and agent traces. |

### Daemon URL

The daemon runs at `http://localhost:3001` by default. Override it with:

```bash
stackmcp --daemon-url http://localhost:3002
# or
STACKMCP_DAEMON_URL=http://localhost:3002 stackmcp run youtube-to-obsidian
```

## Commands

```
stackmcp --help          Show usage information
stackmcp init            Scaffold a workspace
stackmcp stacks          List available stacks
stackmcp run <name>      Run a stack with arguments
stackmcp history         View execution history
stackmcp recommendations Get recommended stacks
stackmcp daemon status   Check daemon connectivity
```

## Repository structure

This repository is the public community hub. It contains:

```
docs/          — concept docs and architecture guides
examples/      — walkthroughs of specific workflows
templates/     — reusable workflow JSON definitions
workflows/     — workflow system documentation
```

## License

[MIT](LICENSE)
