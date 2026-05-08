#!/bin/bash
# Usage: discord_send_message.sh <channel_id> <message>
CHANNEL_ID="$1"
MESSAGE="$2"

curl -s -X POST "https://discord.com/api/v10/channels/${CHANNEL_ID}/messages" \
  -H "Authorization: Bot $DISCORD_AGENT_TOOL_BOT_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"content\": $(echo "$MESSAGE" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))')}"
