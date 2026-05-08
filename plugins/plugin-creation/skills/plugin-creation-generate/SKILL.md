---
name: plugin-creation-generate
description: Generate all plugin files from the design.
user-invocable: false
---

# Generate Plugin Files

Generate under `plugins/<plugin-name>/`:

```
.claude-plugin/plugin.json   # name, version ("1.0.0"), description, author
skills/<skill>/SKILL.md      # YAML frontmatter + content
.mcp.json                    # MCP servers (only if needed — see format below)
README.md                    # Overview, setup, features table
```

## SKILL.md Format

```yaml
---
name: <plugin-name>-start          # Orchestrator: <plugin-name>-start
description: <activation condition>
# user-invocable: omit for orchestrator, set false for task skills
---
```

```yaml
---
name: <plugin-name>-<task>         # Task skill: <plugin-name>-<task>
description: <activation condition>
user-invocable: false
---
```

## Naming Rules

- **Orchestrator**: `<plugin-name>-start` — user-invocable, no `user-invocable` field needed
- **Task skills**: `<plugin-name>-<task>` — always set `user-invocable: false`
- Skill directory name must match the skill `name` field

Body contains task execution steps and required knowledge.

## .mcp.json Format (if MCP servers are needed)

```json
{
  "mcpServers": {
    "<server-name>": {
      "command": "<command>",
      "args": ["<arg1>", "<arg2>"],
      "env": {
        "ENV_VAR": "<value>"
      }
    }
  }
}
```

Example for a GitHub MCP server:
```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_TOKEN}"
      }
    }
  }
}
```
