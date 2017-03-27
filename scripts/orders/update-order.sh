#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/orders"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "order": {
      "shipping_address": "'"$SHIP"'",
      "paid": "true",
      "total": "0",
      "billing_address": "'"$BILL"'"
    }
  }'

echo
