---
name: register-plugin
description: Register plugin in marketplace.json.
user-invocable: false
---

# Register Plugin

Add to `plugins` array in `.claude-plugin/marketplace.json`:

```json
{
  "name": "<plugin-name>",
  "source": "./plugins/<plugin-name>",
  "description": "<description>"
}
```
