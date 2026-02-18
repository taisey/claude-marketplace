---
name: design-plugin
description: Design plugin structure from hearing results.
user-invocable: false
---

# Design Plugin

Design from hearing results:

- **Plugin name & description**
- **User-invocable skill**: Workflow entry point (1)
- **user_not_invoke skills**: One per task (N)
- **Shared context**: Documented in workflow skill, referenced by task skills
- **MCP servers**: Define if needed

Present design to user and get confirmation before proceeding.
