Citizen.CreateThread(function()
    while true do
        Wait(1)

        if IsControlJustReleased(0, 168) then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)