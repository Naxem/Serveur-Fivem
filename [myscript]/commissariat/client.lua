local hasAlreadyEnteredMarker, lastZone
local playerPed = PlayerPedId()

-- Create function set Armure
function GetBulletproofVest(zone)
	local Armor = GetPedArmour(PlayerPedId())

	print(Armor)

	if Armor < 20 then
    	SetPedArmour(PlayerPedId(), 25)
		TriggerServerEvent('commissariat:givevest')
	end
end

AddEventHandler('commissariat:hasEnteredMarker', function(zone)
    currentAction = GetBulletproofVest(zone)
    currentActionData = {zone = zone}
end)

AddEventHandler('commissariat:hasExitedMarker', function(zone)
	currentAction = nil
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in ipairs(Config.Zones) do
			local blip = AddBlipForCoord(v)

			SetBlipSprite (blip, 60)
			SetBlipColour (blip, 38)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName('STRING')
			AddTextComponentSubstringPlayerName(_U('commissariat'))
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
			TriggerEvent('commissariat:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('commissariat:hasExitedMarker', lastZone)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)