# YouTube to Obsidian

This example demonstrates a workflow that fetches metadata from a YouTube video and creates a formatted note in Obsidian.

> **Note:** This is a design example showing how StackMCP workflows are structured. The specific tools and implementations shown here may not be available yet.

## Workflow template

The [youtube-to-obsidian.json](../templates/youtube-to-obsidian.json) template defines the workflow. Here's what it does:

1. **Input** — the user provides a YouTube video URL
2. **Fetch metadata** — the workflow extracts video title, channel, description, and duration from the YouTube API
3. **Fetch transcript** — it retrieves the video transcript (when available)
4. **Format content** — it structures the metadata and transcript into a markdown note
5. **Write to Obsidian** — it creates a new note in the configured Obsidian vault

## Prerequisites

- StackMCP daemon running locally
- YouTube Data API access configured
- Obsidian vault path configured in StackMCP
- Local vault plugin enabled (or Obsidian URI handling)

## Usage

Once the StackMCP daemon is running with the workflow loaded, you can ask your AI assistant:

> "Save the transcript from this YouTube video to my Obsidian vault: https://youtube.com/watch?v=..."

The assistant invokes the workflow, and the note appears in your vault.

## Customization

You can modify the template to:

- Change the note format (frontmatter structure, sections, tags)
- Add additional processing steps (AI summarization, keyword extraction)
- Route output to a different tool instead of Obsidian

## Related resources

- [Workflow templates](../templates/)
- [Workflow system overview](../workflows/README.md)
