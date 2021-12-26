local functions = {}
local settings = require(script["easyWebhook Settings"])
functions.__index = functions

function functions:Create(webhookurl)
	local webhookurl = webhookurl:gsub(settings.olddomain, settings.maindomain)
	return require(8368124124)(webhookurl)
end

return functions
