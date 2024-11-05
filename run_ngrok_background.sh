#!/bin/bash

# Start ngrok in the background
ngrok start --all --log=stdout > ngrok.log &

sleep 5

curl --silent http://localhost:4040/api/tunnels | jq -r '.tunnels[ ] | .public_url, [.config | .addr]' > tunnels.json

cat tunnels.json
exit 0
