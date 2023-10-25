# telegram-bot-server

## Setup 
> Docker should be installed.

1. Get `api_id` and `api_hash` from [telegram](https://my.telegram.org).
2. Get the `bot_token` from BotFather Telegram Bot.
3. Get the `webhook_url` from the Setup of your Bot Webhook Listener
4. Get the `bot_server_base_url` either using noip or ngrok.
5. Clone this [repo](https://github.com/chitranjan-gupta/telegram-bot-server)
```bash
git clone https://github.com/chitranjan-gupta/telegram-bot-server
```

## Build
1. Go to directory telegram-bot-server
  ```bash
  cd telegram-bot-server
  ```
2. Build the docker image
  ```bash
  docker build -t telegram .
  ```

## Execute
1. Make GET request to `https://api.telegram.org/bot[BOT_TOKEN]/logOut` replace with bot_token to logout Telegram Cloud API Server.
2. Run the docker image
  ```bash
  docker run -p 80:80 telegram --api-id [API_ID] --api-hash [API_HASH] --http-port 80
  ``` 
3. Make GET request to `https://[BOT_SERVER_BASE_URL]/bot[BOT_TOKEN]/setWebhook?url=[WEBHOOK_URL]/&drop_pending_updates=true` replace with bot_server_base_url, bot_token and webhook_url to set webhook url to get updates from the bot.

## Migrate
If you want to migrate to different server you have to all the steps from above but before that you have do this
1. Make GET request to `https://[BOT_SERVER_BASE_URL]/bot[BOT_TOKEN]/getWebhookInfo` replace with bot_server_base_url and bot_token to check about your webhook url.
2. Make GET request to `https://[BOT_SERVER_BASE_URL]/bot[BOT_TOKEN]/deleteWebhook?drop_pending_updates=true` replace with bot_server_base_url and bot_token to remove your webhook url set previously.
3. Make GET request to `https://[BOT_SERVER_BASE_URL]/bot[BOT_TOKEN]/close` replace with bot_server_base_url and bot_token to stop the bot instance.
4. Make GET request to `https://[BOT_SERVER_BASE_URL]/bot[BOT_TOKEN]/logOut` replace with bot_server_base_url and bot_token to logout from Local API Server.

## Sources:
1. https://core.telegram.org/bots/api
2. https://github.com/tdlib/telegram-bot-api
3. https://api.telegram.org/bot[BOT_TOKEN]/getWebhookInfo
4. https://api.telegram.org/bot[BOT_TOKEN]/setWebhook?url=[WEBHOOK_URL]&drop_pending_updates=true
5. https://api.telegram.org/bot[BOT_TOKEN]/deleteWebhook?drop_pending_updates=true
6. https://api.telegram.org/bot[BOT_TOKEN]/close
