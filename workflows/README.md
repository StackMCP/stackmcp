# Workflows

Workflows are reusable, multi-step automation sequences that StackMCP executes. They let you chain together tools and data sources into repeatable processes that can be triggered by an AI assistant.

## How it works

A workflow is defined as a JSON file containing:

- **Inputs** — parameters the user or AI assistant provides when triggering the workflow
- **Steps** — ordered actions, each calling a specific tool with parameters derived from inputs or previous steps
- **Outputs** — values the workflow returns after completing

## Creating a workflow

Workflow templates live in the [templates](../templates/) directory. Here's the basic structure:

```json
{
  "name": "my-workflow",
  "description": "What this workflow does",
  "version": "0.1.0",
  "inputs": [
    {
      "name": "input_name",
      "type": "string",
      "description": "Describe the input",
      "required": true
    }
  ],
  "steps": [
    {
      "id": "step_1",
      "tool": "tool_name",
      "params": {
        "param_name": "${inputs.input_name}"
      }
    }
  ],
  "outputs": [
    {
      "name": "result",
      "value": "${steps.step_1.result}",
      "description": "Describe the output"
    }
  ]
}
```

## Variable interpolation

Workflow templates support `${}` syntax to reference values:

- `${inputs.name}` — an input parameter
- `${steps.step_id.field}` — a field from a previous step's result

## Current templates

- [YouTube to Obsidian](../templates/youtube-to-obsidian.json) — fetch video metadata and save a formatted note

## Notes

- Workflow execution is handled by the StackMCP Workflow Engine running in the daemon
- Tools must be registered with the daemon before a workflow that uses them can run
- Templates define the workflow structure; actual availability depends on configured tool connections
