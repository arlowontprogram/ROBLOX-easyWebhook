local easyFunctions = {}
local http = game:GetService("HttpService")

local validDatatypes = {
	["content"] = {typeis = "string", length = 2000},
	["username"] = {typeis = "string", length = math.huge},
	["avatar_url"] = {typeis = "string", length = math.huge},
	["embeds"] = {typeis = "table", length = 10}
}

function easyFunctions:CheckHTTPEnabled()
	local request
	local ok, msg = pcall(function()
		request = http:GetAsync('https://google.com')
	end)
	if not ok then warn("easyWebhook | " .. msg) end
	return ok
end

function easyFunctions:JSONify(data)
	return http:JSONEncode(data)
end

function easyFunctions:STRINGify(data)
	return http:JSONDecode(data)
end

function easyFunctions:CheckIsDataType(datatype)
	for datatypetree, _ in pairs(validDatatypes) do
		if datatypetree == datatype then
			return true
		end
	end
	return false
end

return function(url)
	-- check https enabled
	assert(easyFunctions:CheckHTTPEnabled(), "easyWebhook | HTTPS is not enabled! Enable this setting via game settings.")
	local mainfunctions = {}
		
	function mainfunctions:PostAsync(data)
		if data then
			local foundContent = false
			for datatype, datainformation in pairs(data) do
				datatype = datatype:lower()
				if easyFunctions:CheckIsDataType(datatype) then
					if datatype == "content" and datainformation ~= nil then
						foundContent = true
					end
					if #datainformation > validDatatypes[datatype].length then
						warn(string.format("easyWebhook | %s exceeds the limit (%i) by %i", datatype, validDatatypes[datatype].length, #datainformation - validDatatypes[datatype].length))
						return
					end
				end
			end
			if foundContent then
				local data = easyFunctions:JSONify(data)
				local requestresponse
				local ok, msg = pcall(function()
					requestresponse = http:PostAsync(url, data, Enum.HttpContentType.ApplicationJson, false)
				end)
				if not ok then
					warn("easyWebhook | " .. msg)
					return {status = "error", message = msg}
				else
					return {status = "succes", message = msg}
				end
			else
				warn("easyWebhook | no content type provided or data provided for content.")
			end
		else
			warn("easyWebhook | No data was sent to function..")
			return
		end
	end
	
	return mainfunctions
end
