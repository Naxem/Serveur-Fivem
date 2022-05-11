ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('pacifique:givemoney')
AddEventHandler('pacifique:givemoney', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local randomMoney = math.random(950000, 2000000)
	local rob = tonumber(randomMoney)

	xPlayer.addAccountMoney('money', rob)
	xPlayer.showNotification(_U('give_money', rob))
end)