#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/orders"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "order": {
      "shipping_address": "'"$SHIP"'",
      "paid": "false",
      "total": "0",
      "billing_address": "'"$BILL"'"
    }
  }'

echo
# BAhJIiUyNjk2NzdkNzBhM2Q5ZDliNmZjZDAyM2YwNWQ4ZDMzYgY6BkVG--1cbb5c74c351ecaa1927b64011702496390776b3
