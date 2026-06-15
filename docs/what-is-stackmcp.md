# What is StackMCP?

StackMCP is a local server that implements the [Model Context Protocol (MCP)](https://modelcontextprotocol.io) to connect AI assistants — like Claude — to the tools and services in your development stack.

## The idea

AI assistants are powerful on their own, but they can't reach into your local environment. StackMCP bridges that gap by exposing your local tooling as MCP resources and tools. Instead of copying terminal output into a chat, your AI assistant can interact directly with the services you already use.

For example, a single request like "grab the latest YouTube video from my subscriptions and save a summary to Obsidian" can trigger a multi-step workflow:

1. Fetch video metadata from YouTube
2. Transcribe or summarize the content
3. Create a formatted note in Obsidian

## Key concepts

- **Tools** — discrete capabilities StackMCP exposes to AI assistants (query a database, fetch from an API, read a file)
- **Workflows** — multi-step automation sequences composed from tools. Workflows can be defined as reusable JSON templates
- **Daemon** — StackMCP runs as a background process that manages tool connections, schedules workflows, and handles requests

## What StackMCP is not

StackMCP is not a hosted platform, a SaaS product, or a replacement for existing automation tools. It's a local daemon that runs on your machine and connects to services you already control.

## Status

StackMCP is in active development. The documentation, templates, and examples in this repo reflect the current design and planned direction. See the [roadmap](../ROADMAP.md) for what's coming next.
