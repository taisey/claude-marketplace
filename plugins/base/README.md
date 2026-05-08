# base

Base plugin providing GitHub, Discord, and Obsidian integrations for Claude Code.

## Prerequisites

- **github skill**: `gh` CLI required. The skill outputs an install guide if missing.
- **discord skill**: `DISCORD_AGENT_TOOL_BOT_TOKEN` env var required.
- **obsidian skill**: Obsidian must be running with CLI enabled (**Settings → General → Command line interface**).

## Setup

```bash
# GitHub
gh auth login
```

## Features

| Type | Name | Description |
|------|------|-------------|
| Skill | `github` | GitHub operations via gh CLI (PRs, Issues, Branches, Commits) |
| Skill | `discord` | Discord bot operations (send/read messages, list channels/guilds) |
| Skill | `obsidian` | Obsidian vault operations via obsidian CLI (notes, tasks, search, daily notes, plugin dev) |
