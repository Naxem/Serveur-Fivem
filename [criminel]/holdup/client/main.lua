local hasAlreadyEnteredMarker, lastZone
local playerPed = PlayerPedId()
local timeholdup = 0

-- Create function Holdup
function Getholdup(zone)
	local timerforholdup = 15
	local LSPDrandom = math.random(1, 2)

	if timeholdup < 1 then

		exports['progressBars']:startUI(15000, "Braquage en cours")

		if LSPDrandom < 2 then
			if GetPlayerWantedLevel(PlayerId()) < 1 then
				SetPlayerWantedLevel(PlayerId(), 2, false)
				SetPlayerWantedLevelNow(PlayerId(), false)
			end
		end

		while timerforholdup > 0 do
			Citizen.Wait(1000)
			if timerforholdup > 0 then
				timerforholdup = timerforholdup - 1
			end
		end

		if  hasAlreadyEnteredMarker then
			TriggerServerEvent('holdup:givemoney')
			timeholdup = 2
		end
	end
end

function Timerend(timer)
	local timer = 60 -- sec

	if timeholdup > 1 then
		while timer > 0 do
			Citizen.Wait(1000)
			if timer > 0 then
				timer = timer - 1
			end
		end
	end
	timeholdup = 0
end

AddEventHandler('holdup:hasEnteredMarker', function(zone)
    currentAction = Getholdup(zone)
    currentActionData = {zone = zone}
end)

AddEventHandler('holdup:hasExitedMarker', function(zone)
	currentAction = Timerend(timer)
end)

-- Enter / Exit marker events & draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), false, nil, true

		for k,v in pairs(Config.Zones) do
			local distance = #(playerCoords - v)

			if distance < Config.DrawDistance then
				letSleep = false
				DrawMarker(Config.MarkerType, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)

				if distance < Config.MarkerSize.x then
					isInMarker, currentZone = true, k
				end
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('holdup:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('holdup:hasExitedMarker', lastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)