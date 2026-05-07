---
name: discord
description: Activates when sending messages to Discord, reading messages from Discord channels, listing channels/guilds, or any Discord bot operations.
version: 1.0.0
---

# Discord Bot Operations

Use the Discord REST API with the bot token for all operations.

## Setup

The bot token must be available as an environment variable:

```bash
echo $DISCORD_BOT_TOKEN
```

If not set, ask the user to provide it:

```bash
export DISCORD_BOT_TOKEN="your-bot-token"
```

## Send a Message

```bash
curl -s -X POST "https://discord.com/api/v10/channels/{channel_id}/messages" \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"content": "Your message here"}'
```

## Get Messages

```bash
# Latest 50 messages (default)
curl -s "https://discord.com/api/v10/channels/{channel_id}/messages?limit=50" \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" | jq '.[].content'

# With author info
curl -s "https://discord.com/api/v10/channels/{channel_id}/messages?limit=20" \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" \
  | jq '.[] | {author: .author.username, content: .content, timestamp: .timestamp}'
```

## List Guilds (Servers)

```bash
curl -s "https://discord.com/api/v10/users/@me/guilds" \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" \
  | jq '.[] | {id: .id, name: .name}'
```

## List Channels in a Guild

```bash
curl -s "https://discord.com/api/v10/guilds/{guild_id}/channels" \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" \
  | jq '.[] | select(.type == 0) | {id: .id, name: .name}'
```

`type == 0` filters for text channels only.

## Finding IDs

**From Discord (recommended):**
1. Enable Developer Mode: User Settings → Advanced → Developer Mode
2. Right-click on a server icon → Copy Server ID (guild_id)
3. Right-click on a channel → Copy Channel ID

**From the API:**

```bash
# List guilds to find guild_id
curl -s "https://discord.com/api/v10/users/@me/guilds" \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" | jq '.[] | {id, name}'

# Then list channels for that guild
curl -s "https://discord.com/api/v10/guilds/{guild_id}/channels" \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" | jq '.[] | select(.type==0) | {id, name}'
```

## Troubleshooting

### Bot token not set
Ask the user to provide the Discord bot token and set it as `DISCORD_BOT_TOKEN`.

### 401 Unauthorized
The token is invalid or missing. Verify the token is correct.

### 403 Forbidden
The bot lacks permissions in that channel. Required permissions:
- **Read messages**: View Channel + Read Message History
- **Send messages**: View Channel + Send Messages

### 429 Rate Limited
Wait the number of seconds specified in `retry_after`:

```bash
# Response body will contain:
# {"retry_after": 1.234, "global": false}
```
