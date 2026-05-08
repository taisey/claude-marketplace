#!/bin/bash
# Usage: discord_list_guilds.sh
curl -s "https://discord.com/api/v10/users/@me/guilds" \
  -H "Authorization: Bot $DISCORD_AGENT_TOOL_BOT_TOKEN" \
  | jq '.[] | {id: .id, name: .name}'
