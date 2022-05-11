local hasAlreadyEnteredMarker, lastZone
local playerPed = PlayerPedId()

-- Create function Health
function GetHealth(zone)
    SetEntityHealth(playerPed, 200)
end

AddEventHandler('hopital:hasEnteredMarker', function(zone)
    currentAction = GetHealth(zone)
    currentActionData = {zone = zone}
end)

AddEventHandler('hopital:hasExitedMarker', function(zone)
	currentAction = nil
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in ipairs(Config.Zones) do
			local blip = AddBlipForCoord(v)

			SetBlipSprite (blip, 61)
			SetBlipColour (blip, 2)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('hospital'))
			EndTextCommandSetBlipName(blip)
	end
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
			TriggerEvent('hopital:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('hopital:hasExitedMarker', lastZone)
		end
	end
end)