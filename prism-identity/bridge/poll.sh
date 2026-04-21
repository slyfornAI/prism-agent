#!/bin/bash
LAST_ID="a020"  # Set to A's last message ID that you've already read
echo "B polling started..."
while true; do
  new_id=$(cat ~/.pi/prism-identity/bridge/a-to-b.json | jq -r '.messages[-1].id')
  if [ "$new_id" != "$LAST_ID" ]; then
    echo "New from A! ($new_id)"
    break
  fi
  echo "Polling... $(date +%H:%M:%S)"
  sleep 5
done
