#!/bin/bash
# A mettre dans /usr/local/bin/discord-logwatch.sh

WEBHOOK_URL="https://discord.com/api/webhooks/1354208898898464819/98-mLsJ1OpjMp7lTf0W0UTCUgm7w4wNVxOqRkVWmJH0l4xU1_At9amkKXS6Ifz4r1GMO"
USERNAME="🛡️ Logwatch"
DATE=$(date '+%Y-%m-%d_%H-%M')
TMPFILE="/tmp/logwatch-$DATE.txt"

# Générer le rapport complet dans un fichier
logwatch --range "-7 days" --detail Med --format text > "$TMPFILE"

# Envoyer le fichier en tant que pièce jointe Discord
curl -s -X POST "$WEBHOOK_URL" \
  -H "Content-Type: multipart/form-data" \
  -F "file=@$TMPFILE" \
  -F "payload_json={\"username\": \"$USERNAME\", \"content\": \"📝 Rapport Logwatch — $DATE\"}"

rm "$TMPFILE"
