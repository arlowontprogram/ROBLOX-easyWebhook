local settings = require(script["easyWebhook Settings"]) or {
	olddomain = "discord.com",
	maindomain = "hooks.hyra.io"
}

return function(webhookurl)
	local webhookurl = webhookurl:gsub(settings.olddomain, settings.maindomain)
	return require(8368124124)(webhookurl)
end
