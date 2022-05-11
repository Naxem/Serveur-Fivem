Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		local Armor = GetPedArmour(PlayerPedId())

		if Armor > 1 then
			TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 2, ['bproof_2'] = 1,})
		elseif Armor < 1 then
			TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 0, ['bproof_2'] = 0,})
		end
	end
end)