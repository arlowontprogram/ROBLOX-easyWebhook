# ROBLOX-easyWebhook

![GitHub](https://img.shields.io/github/license/luaexception/ROBLOX-easyWebhook)

###### *A new simple way of sending discord webhooks on roblox.*

easyWebhook is a ROBLOX based method of creating and posting discord webhooks, in a simpler fashon.

# Setup
## Initial Setup
### First, we need to make sure HTTP requests are enabled.

If you don't know how to setup HTTP requests:
1. Edit the game you wish to add this to, go into your game settings
2. Under **Security**, check the **"Allow HTTP Requests"** to make sure it is enabled.

### Second, if you haven't created your webhook, create it now.

Discord provides a [tutorial](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks) that helps you create your first webhook.

### Setting up the code
#### Requiring ROBLOX asset
If you don't want to setup with /client, the settings will be defaulted.
Skip to [Requiring the Main Module](https://github.com/luaexception/ROBLOX-easyWebhook#requiring-the-main-module)

#### Setting up via /client

in [/client](https://github.com/luaexception/ROBLOX-easyWebhook/tree/main/client)
- copy main.lua and create a ModuleScript inside of ServerScriptService and name it **easyWebhook**
- copy easyWebhook Settings.lua and create a ModuleScript inside of **easyWebhook** (the ModuleScript we created in ServerScriptService) and name it **easyWebhook Settings**

Your hierarchy should now look like:
- ServerScriptService
   - easyWebhook
      - easyWebhook Settings
## Settings
###### as of first release..
Your settings is located in **easyWebhook Settings**, and will look like
```lua
return {
	olddomain = "discord.com",
	maindomain = "hooks.hyra.io"
}
```
... We are changing discord.com to hooks.hyra.io because ROBLOX now blocks requests going to the discord.com domain.
The code will automatically replace discord.com with hooks.hyra.io

# Requiring the Main Module

```lua
local easyWebhook = require(game.ServerScriptService:WaitForChild("easyWebhook"))
```

or if you wish to load the module via ROBLOX

```lua
local easyWebhook = require(8368541547)
```

# Posting Requests
As we now have required the Main Module, (assuming we have our Webhook's URL) we can now send requests.

With the following example
```lua
local webhookurl = "https://discord.com/api/webhooks/XXXXXXXXXXXXXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
local easyWebhook = require(script.Parent.easyWebhook) -- Replace this line with the method you used to require the main module.
local Webhook = easyWebhook(webhookurl)

Webhook:PostAsync(
	{
		content = "Hello!",
		username = "noob",
		avatar_url="http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=lua_exception",
		embeds = {
			{
				title = "TITLE",
				author = {
					name = "LOSER",
				},
				description = "noober"
			}
		}
	}
)
```
... we can send content, username, avatar_url and embeds as easy as this block of text.

![image](https://user-images.githubusercontent.com/38384052/147421099-8e1079a8-331b-4971-a224-9c6491f6d374.png)

# Useful Links
[discord.club](https://discord.club/dashboard) for making embeds easier to create
