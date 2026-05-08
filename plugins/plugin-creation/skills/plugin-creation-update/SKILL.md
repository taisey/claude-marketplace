---
name: plugin-creation-update
description: Use when the user wants to update an existing plugin.
---

# Update Plugin

1. Ask which plugin to update
2. Read existing plugin structure (plugin.json, skills/, README.md)
3. Hear what changes are needed (add/modify/delete skills, MCP changes, etc.)
4. Apply changes
5. **plugin-creation-validate** - 変更後のプラグイン全体を検証（クリティカル項目が全てパスするまで修正を繰り返す）
6. Bump version in plugin.json
7. Update marketplace.json if needed
