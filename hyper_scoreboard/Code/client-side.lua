local isOpen = false
local session = 0
local cachedData = nil

local function Open()
	if isOpen then
		return
	end
	isOpen = true

	session = session + 1
	local current = session

	if cachedData then
		SendNUIMessage({
			action = "Open",
			data = cachedData,
		})
	end

	TriggerServerEvent("hyper_scoreboard:Request")

	CreateThread(function()
		while isOpen do
			Wait(Config.RefreshInterval)

			if isOpen and session == current then
				TriggerServerEvent("hyper_scoreboard:Request")
			end
		end
	end)
end

local function Close()
	if not isOpen then
		return
	end
	isOpen = false

	SendNUIMessage({
		action = "Close",
	})
end

RegisterNetEvent("hyper_scoreboard:Receive", function(data)
	if not isOpen then
		return
	end

	cachedData = data

	SendNUIMessage({
		action = "Open",
		data = data,
	})
end)

--// Commands
local function Toggle()
	if isOpen then
		Close()
	else
		Open()
	end
end

RegisterCommand("togglescoreboard", Toggle, false)
RegisterKeyMapping("togglescoreboard", "View scoreboard", "keyboard", Config.OpenKey)

AddEventHandler("onResourceStop", function(resource)
	if resource == GetCurrentResourceName() then
		SendNUIMessage({
			action = "Close",
		})
	end
end)
