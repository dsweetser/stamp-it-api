## Stamp-It API

This is the API for stamp-it, a website that converts your photographs into
stamps!  The API is built using Ruby on Rails.

ERD: ![](http://i.imgur.com/hjIGtuF.png)

Front End: https://github.com/dsweetser/stamp-it
Deployed Front End: https://dsweetser.github.io/stamp-it/
Deployed API: https://dry-basin-81323.herokuapp.com/

## API

Use this as the basis for your own API documentation. Add a new third-level
heading for your custom entities, and follow the pattern provided for the
built-in user authentication documentation.

Scripts are included in [`scripts`](scripts) to test built-in actions. Add your
own scripts to test your custom API. As an alternative, you can write automated
tests in RSpec to test your API.

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |

#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```

### Reset Database without dropping

This is not a task developers should run often, but it is sometimes necessary.

**locally**

```sh
bin/rake db:migrate VERSION=0
bin/rake db:migrate db:seed db:examples
```

**heroku**

```sh
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate db:seed db:examples
```

### STAMPS TABLE

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
|  GET   | `/stamps`              | `stamps#index`    |
|  POST  | `/stamps/`             | `stamps#create`   |

### GET /stamps

Returns an index of all the stamps users have created.  No Authentication required.

```sh
\
  ```

  response:
  ```md
  HTTP/1.1 200 OK
  Content-Type: application/json; charset=utf-8

  {
    "stamps": [
      {
        "id": 1,
        "name": "Splendor"
      },
      {
        "id": 2,
        "name": "Caverna"
      }
    ]
  }
  ```

### GET /stamps/:id

Returns a single game id. No Authentication required.

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/stamps/" \
curl "${API}${URL_PATH}" \
  --include \
  --request GET
  ```


response:
```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "stamps": [
    {
      "id": 1,
      "name": "Splendor"
    }
  ]
}
```

### POST /stamps

Creates a game and returns json with the game created. Requires authentication.

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/stamps/"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "game": {
      "name": "'"${NAME}"'"
    }
  }'
```

```md
HTTP/1.1 201 Created
{
  "game": {
    "id":13,
    "name":"Carcassonne"
  }
}
```

### SESSION TABLE

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
|  GET   | `/orders`            | `orders#index`  |
|  POST  | `/orders/`           | `orders#create` |
| PATCH  | `/orders/:id`        | `orders#create` |
| DELETE | `/orders/:id`        | `orders#destroy`|

### GET /orders
Returns a JSON index of all the orders users have created.  No Authentication required.

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/orders/"
curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  ```

response
```md
HTTP/1.1 200 OK
{
  "orders":[
    {
      "id":2,
      "players":2,
      "rating":5,
      "notes":null,
      "user":4,
      "editable":false,
      "game":
      {
        "id":4,
        "name":"Takenoko"
      }
    }
    ...
  ]
}
```

### POST /orders/

Creates a new order with the current user's ID. Requires authentication token from the creator, game_id, and a rating.  Returns a JSON string for the created order.

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/orders/"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "order": {
      "game_id": "'"${GAME}"'",
      "rating": "'"${RATING}"'",
      "players": "'"${PLAYERS}"'",
      "notes": "'"${NOTES}"'"
    }
  }'
  ```

  response
  ```md
HTTP/1.1 201 Created
{
  "order":
    {
    "id":41,
    "players":2,
    "rating":4,
    "notes":"",
    "user":5,
    "editable":true,
    "game":
      {
      "id":2,
      "name":"Caverna"
      }
    }
  }
```

### PATCH /orders/:id

Updates a order. Requires authentication token from the orders creator, game_id, and a rating.  Returns a JSON string for the updated order.

```sh
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/orders/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "order": {
      "game_id": "'"${GAME}"'",
      "user_id": "'"${USER}"'",
      "rating": "'"${RATING}"'",
      "players": "'"${PLAYERS}"'",
      "notes": "'"${NOTES}"'"
    }
  }'
  ```

  response
  ```md
  HTTP/1.1 200 OK
  {
    "order":
      {
      "id":41,
      "players":2,
      "rating":4,
      "notes":"dude why didn't I put notes in before!?!?!?",
      "user":5,
      "editable":true,
      "game":
        {
        "id":2,
        "name":"Caverna"
        }
      }
    }
  ```

  ### DESTROY orders/:id

  Destroys a order. Requires id and authorization token from the original creator of the order.  Returns no content.

  ```sh
  API="${API_ORIGIN:-http://localhost:4741}"
  URL_PATH="/orders/${ID}"
  curl "${API}${URL_PATH}/" \
    --include \
    --request DELETE \
    --header "Content-Type: application/json" \
    --header "Authorization: Token token=$TOKEN"
  ```

  response
  ```md
  HTTP/1.1 204 No Content
  ```


## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
