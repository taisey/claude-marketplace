---
name: generate-plugin-files
description: Generate all plugin files from the design.
user-invocable: false
---

# Generate Plugin Files

Generate under `plugins/<plugin-name>/`:

```
.claude-plugin/plugin.json   # name, version, description, author
skills/<skill>/SKILL.md      # YAML frontmatter + content
.mcp.json                    # MCP servers (only if needed)
README.md                    # Overview, setup, features table
```

## SKILL.md Format

```yaml
---
name: <skill-name>
description: <activation condition>
user-invocable: false  # Only for task skills. Omit for workflow skills.
---
```

Body contains task execution steps and required knowledge.
