#!/bin/bash
IP="$1"
WEBHOOK="$2"
JAIL="$3"

COUNTRY=$(geoiplookup "$IP" | awk -F: '{gsub(/,/, " "); print $2}' | xargs)

curl -s -X POST -H "Content-Type: application/json" \
-d "{\"content\":\"**[Fail2Ban]** Banned IP: $IP\nJail: $JAIL\nCountry: $COUNTRY\nTime: $(date +'%Y-%m-%d %H:%M:%S')\"}" \
"$WEBHOOK"