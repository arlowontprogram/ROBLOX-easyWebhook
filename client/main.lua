local settings = {
	olddomain = "discord.com",
	maindomain = "hooks.hyra.io",
    	HidePrints = false
}

return function(webhookurl, settingsfromfunctionrun)
	-- change settings if any has been passed through
	local settingsforruntime = settingsfromfunctionrun or settings
	local webhookurl = webhookurl:gsub(settingsforruntime.olddomain, settingsforruntime.maindomain)
	-- hide unnecessary settings from being sent
	table.remove(settingsforruntime, table.find(settingsforruntime, "maindomain"))
	table.remove(settingsforruntime, table.find(settingsforruntime, "olddomain"))
	-- return module
	return require(8368124124)(webhookurl, settingsforruntime)
end
