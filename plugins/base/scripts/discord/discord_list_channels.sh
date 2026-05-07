#!/bin/bash
# Usage: discord_list_channels.sh <guild_id>
GUILD_ID="$1"

curl -s "https://discord.com/api/v10/guilds/${GUILD_ID}/channels" \
  -H "Authorization: Bot $DISCORD_AGENT_TOOL_BOT_TOKEN" \
  | jq '.[] | select(.type == 0) | {id: .id, name: .name}'
