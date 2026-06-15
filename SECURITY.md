# Security Policy

## Reporting a vulnerability

StackMCP is a local tool that connects to services and data sources on your machine. If you discover a security vulnerability, please report it privately.

Send details to **security@stackmcp.dev** (or open a GitHub Security Advisory if that address is not yet set up).

Please include:

- A description of the vulnerability
- Steps to reproduce
- Potential impact

You should receive a response within 5 business days.

## Scope

This security policy covers the StackMCP daemon, its tool connectors, and the workflow engine. It does not cover third-party services that StackMCP connects to.

## Best practices

- StackMCP runs locally and does not expose your tools or data to the network. Verify that any tool connectors or workflow templates you add follow this same principle
- Review workflow templates before running them, especially if they come from third-party sources
- Keep your StackMCP installation updated
