#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/stamps"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "stamp": {
      "cost": "10",
      "order_id": 2
    }
  }'

echo
# BAhJIiUyNjk2NzdkNzBhM2Q5ZDliNmZjZDAyM2YwNWQ4ZDMzYgY6BkVG--1cbb5c74c351ecaa1927b64011702496390776b3
