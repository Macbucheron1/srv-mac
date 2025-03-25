#!/bin/bash
# A mettre dans /usr/local/bin/discord-alert.sh

WEBHOOK_URL="https://discord.com/api/webhooks/1354127256166862858/LrUVvXskfNbOZqgAYpX6brLUZolK6nqAYhvHWuEhnqfr5SSEoFhqrs62jkHM10Gx-t_Q"
USERNAME="🛡️ Serveur Sécurité"
MESSAGE="$1"

# Protection contre messages vides
if [ -z "$MESSAGE" ]; then
  echo "Usage: discord-alert.sh \"ton message\""
  exit 1
fi

curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"username\": \"$USERNAME\", \"content\": \"$MESSAGE\"}" \
     "$WEBHOOK_URL"
