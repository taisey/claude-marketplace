---
name: obsidian
description: Activates when interacting with an Obsidian vault — reading, creating, searching, or managing notes, tasks, properties, tags, backlinks, or daily notes. Also activates for plugin/theme development tasks like reloading plugins, checking errors, or running JavaScript in Obsidian.
version: 1.0.0
---

# Obsidian CLI

Use the `obsidian` CLI to interact with a running Obsidian instance. **Obsidian must be open** for commands to work.

## Setup

Enable the CLI in Obsidian: **Settings → General → Command line interface**, then follow the on-screen instructions to add `obsidian` to your PATH.

Verify it works:

```bash
obsidian help
```

## Syntax

**Parameters** take a value with `=`. Quote values that contain spaces:

```bash
obsidian create name="My Note" content="Hello world"
```

**Flags** are boolean switches with no value:

```bash
obsidian create name="My Note" silent overwrite
```

For multiline content use `\n` for newline and `\t` for tab.

## File targeting

Many commands accept `file` or `path`. Without either, the active file is used.

- `file=<name>` — resolves like a wikilink (name only, no path or extension needed)
- `path=<path>` — exact path from vault root, e.g. `folder/note.md`

## Vault targeting

Commands target the most recently focused vault by default. Use `vault=<name>` as the first parameter to target a specific vault:

```bash
obsidian vault="My Vault" search query="test"
```

## Common commands

```bash
# Read a note
obsidian read file="My Note"

# Create a note (silent = don't open it)
obsidian create name="New Note" content="# Hello" template="Template" silent

# Append to a note
obsidian append file="My Note" content="New line"

# Search vault content
obsidian search query="search term" limit=10

# Daily note
obsidian daily:read
obsidian daily:append content="- [ ] New task"

# Set a property (frontmatter)
obsidian property:set name="status" value="done" file="My Note"

# Tasks
obsidian tasks daily todo

# Tags (sorted by count)
obsidian tags sort=count counts

# Backlinks
obsidian backlinks file="My Note"
```

Use `--copy` on any command to copy output to clipboard.  
Use `total` on list commands to get an item count.

## Plugin development

### Dev/test cycle

After editing a plugin or theme:

1. Find the plugin ID if unknown, then reload:
   ```bash
   obsidian help | grep plugin   # or: obsidian plugin:list
   obsidian plugin:reload id=my-plugin
   ```
2. Check for errors:
   ```bash
   obsidian dev:errors
   ```
3. Verify visually:
   ```bash
   obsidian dev:screenshot path=screenshot.png
   obsidian dev:dom selector=".workspace-leaf" text
   ```
4. Check console output:
   ```bash
   obsidian dev:console level=error
   ```

### Additional dev commands

```bash
# Run JavaScript in the app context
obsidian eval code="app.vault.getFiles().length"

# Inspect CSS
obsidian dev:css selector=".workspace-leaf" prop=background-color

# Toggle mobile emulation
obsidian dev:mobile on
```

## Troubleshooting

### `obsidian: command not found`

The CLI binary is not in PATH. Go to **Settings → General → Command line interface** in Obsidian and follow the setup instructions.

### Commands fail or time out

Obsidian must be running. Open Obsidian, then retry.

### Wrong vault targeted

Use `vault=<name>` as the first parameter, or bring the target vault to the foreground in Obsidian before running the command.
