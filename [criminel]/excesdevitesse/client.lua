Citizen.CreateThread(function()
    while true do
        Wait(1000)

        local timeout = true

        if timeout == true then
	    	playerPed = GetPlayerPed(-1)
	    	if playerPed then
			    playerCar = GetVehiclePedIsIn(playerPed, false)
			    if playerCar and GetPedInVehicleSeat(playerCar, -1) == playerPed then
			    	carSpeed = GetEntitySpeed(playerCar)
                    speed = math.ceil(carSpeed * 3.6)

                    if speed > 150 then
                        if GetPlayerWantedLevel(PlayerId()) > 0 then
                            -- on fait rien
                        elseif GetPlayerWantedLevel(PlayerId()) < 1 then
                            SetPlayerWantedLevel(PlayerId(), 1, false)
                            SetPlayerWantedLevelNow(PlayerId(), false)
                            timeout = false
                        end
                    end
                end
            end
        end

        if timeout == false then
            local time = 900 -- 10 min
              while (time ~= 0) do
                    Wait(1000) -- att 1 sec
                    time = time - 1
                end
            timeout = true
        end

    end 
end)