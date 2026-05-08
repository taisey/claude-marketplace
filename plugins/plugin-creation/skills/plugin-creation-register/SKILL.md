---
name: plugin-creation-register
description: Register plugin in marketplace.json.
user-invocable: false
---

# Register Plugin

Add to `plugins` array in `.claude-plugin/marketplace.json` at the **repository root** (not inside the plugin directory):

```json
{
  "name": "<plugin-name>",
  "source": "./plugins/<plugin-name>",
  "description": "<description>"
}
```
