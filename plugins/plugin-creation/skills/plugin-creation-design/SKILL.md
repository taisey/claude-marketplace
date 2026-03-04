---
name: plugin-creation-design
description: Design plugin structure from hearing results.
user-invocable: false
---

# Design Plugin

Design from hearing results:

- **Plugin name & description**
- **Orchestrator skill**: `<plugin-name>-start` — user-invocable entry point that calls task skills in order
- **Task skills**: `<plugin-name>-<task>` — one per task, `user-invocable: false`
- **Shared context**: Documented in orchestrator skill, referenced by task skills
- **MCP servers**: Define if needed

## Naming Convention

| Role | Name pattern | user-invocable |
|------|-------------|----------------|
| Orchestrator | `<plugin-name>-start` | yes (omit field) |
| Task skill | `<plugin-name>-<task>` | false |

Example for plugin `coding`:
- Orchestrator: `coding-start`
- Tasks: `coding-explore`, `coding-plan`, `coding-create-pr`

Present design to user and get confirmation before proceeding.
