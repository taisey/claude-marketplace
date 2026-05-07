#!/bin/bash
# Usage: discord_get_messages.sh <channel_id> [limit]
CHANNEL_ID="$1"
LIMIT="${2:-50}"

curl -s "https://discord.com/api/v10/channels/${CHANNEL_ID}/messages?limit=${LIMIT}" \
  -H "Authorization: Bot $DISCORD_AGENT_TOOL_BOT_TOKEN" \
  | jq '.[] | {author: .author.username, content: .content, timestamp: .timestamp}'
