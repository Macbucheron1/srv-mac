#!/bin/bash
# A mettre dans /usr/local/bin/discord-lynis.audit.sh

WEBHOOK_URL="https://discord.com/api/webhooks/1354209962368303166/_njPUy5n0pBDtjT4rdt8nXW1b11hQzcWgmPx9h5w_Ma_BY00HRdtO9wqHaIbRBlX09HO"
USERNAME="🔍 Lynis"
DATE=$(date '+%Y-%m-%d_%H-%M')
TMPFILE="/tmp/lynis-audit-$DATE.txt"

# Lancer un audit rapide de sécurité
sudo lynis audit system --quick --no-colors > "$TMPFILE"

# Envoyer le fichier .txt complet vers Discord
curl -s -X POST "$WEBHOOK_URL" \
  -H "Content-Type: multipart/form-data" \
  -F "file=@$TMPFILE" \
  -F "payload_json={\"username\": \"$USERNAME\", \"content\": \"🔐 Rapport Lynis — $DATE\"}"

rm "$TMPFILE"
