#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/list_items"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "list_item": {
      "stamp_id": "'"${STAMP}"'",
      "order_id": "'"${ORDER}"'"
    }
  }'

echo
# BAhJIiUyNjk2NzdkNzBhM2Q5ZDliNmZjZDAyM2YwNWQ4ZDMzYgY6BkVG--1cbb5c74c351ecaa1927b64011702496390776b3
