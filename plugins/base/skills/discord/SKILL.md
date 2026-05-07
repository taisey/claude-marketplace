---
name: discord
description: Activates when sending messages to Discord, reading messages from Discord channels, listing channels/guilds, or any Discord bot operations.
version: 1.0.0
---

# Discord Bot Operations

Scripts are located at:
```
~/.claude/plugins/cache/taisey-marketplace/base/1.4.0/scripts/discord/
```

## Send a Message

```bash
~/.claude/plugins/cache/taisey-marketplace/base/1.4.0/scripts/discord/discord_send_message.sh <channel_id> "<message>"
```

## Get Messages

```bash
# Latest 50 messages (default)
~/.claude/plugins/cache/taisey-marketplace/base/1.4.0/scripts/discord/discord_get_messages.sh <channel_id>

# With custom limit
~/.claude/plugins/cache/taisey-marketplace/base/1.4.0/scripts/discord/discord_get_messages.sh <channel_id> <limit>
```

## List Guilds (Servers)

```bash
~/.claude/plugins/cache/taisey-marketplace/base/1.4.0/scripts/discord/discord_list_guilds.sh
```

## List Channels in a Guild

```bash
~/.claude/plugins/cache/taisey-marketplace/base/1.4.0/scripts/discord/discord_list_channels.sh <guild_id>
```

Text channels only (`type == 0`).

## Finding IDs

**From Discord (recommended):**
1. Enable Developer Mode: User Settings → Advanced → Developer Mode
2. Right-click on a server icon → Copy Server ID (guild_id)
3. Right-click on a channel → Copy Channel ID

## Troubleshooting

### 401 Unauthorized
The token is invalid or missing. Verify `DISCORD_AGENT_TOOL_BOT_TOKEN` is set correctly.

### 403 Forbidden
The bot lacks permissions in that channel. Required permissions:
- **Read messages**: View Channel + Read Message History
- **Send messages**: View Channel + Send Messages

### 429 Rate Limited
Wait the number of seconds specified in `retry_after`:
```json
{"retry_after": 1.234, "global": false}
```
