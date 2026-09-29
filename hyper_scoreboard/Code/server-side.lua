local ESX, QBCore

CreateThread(function()
	if Config.Framework == "ESX" then
		ESX = exports["es_extended"]:getSharedObject()
	elseif Config.Framework == "QBCore" then
		QBCore = exports["qb-core"]:GetCoreObject()
	end
end)

local jobToBox = {}
for index, key in ipairs(Config.BoxOrder) do
	local box = Config.UI[key]

	if box and box.Jobs then
		for _, job in ipairs(box.Jobs) do
			jobToBox[job] = index
		end
	end
end

local function GetJobInfo(src)
	if Config.Framework == "ESX" and ESX then
		local xPlayer = ESX.GetPlayerFromId(src)

		if xPlayer and xPlayer.job then
			return xPlayer.job.name, true
		end
	elseif Config.Framework == "QBCore" and QBCore then
		local player = QBCore.Functions.GetPlayer(src)

		if player and player.PlayerData.job then
			return player.PlayerData.job.name, player.PlayerData.job.onduty
		end
	end

	return nil, false
end

local function BuildData(src)
	local counts = {}
	for i = 1, #Config.BoxOrder do
		counts[i] = 0
	end

	if Config.Framework ~= "Standalone" then
		for _, id in ipairs(GetPlayers()) do
			local job, onDuty = GetJobInfo(tonumber(id))
			local boxIndex = job and jobToBox[job]

			if boxIndex and (Config.Framework ~= "QBCore" or not Config.OnlyOnDuty or onDuty) then
				counts[boxIndex] = counts[boxIndex] + 1
			end
		end
	end

	local boxes = {}
	for index, key in ipairs(Config.BoxOrder) do
		local box = Config.UI[key]

		boxes[index] = {
			name = box.Name,
			color = box.Color,
			count = counts[index],
		}
	end

	return {
		serverId = src,
		players = GetNumPlayerIndices(),
		maxPlayers = GetConvarInt("sv_maxclients", 48),
		boxes = boxes,
		title1 = Config.UI.Title1,
		title2 = Config.UI.Title2,
	}
end

local lastRequest = {}

RegisterNetEvent("hyper_scoreboard:Request", function()
	local src = source
	local now = GetGameTimer()

	if lastRequest[src] and (now - lastRequest[src]) < 250 then
		return
	end

	lastRequest[src] = now

	TriggerClientEvent("hyper_scoreboard:Receive", src, BuildData(src))
end)

AddEventHandler("playerDropped", function()
	lastRequest[source] = nil
end)
