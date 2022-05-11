ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fleeca:givemoney')
AddEventHandler('fleeca:givemoney', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local randomMoney = math.random(150000, 300000)
	local rob = tonumber(randomMoney)

	xPlayer.addAccountMoney('money', rob)
	xPlayer.showNotification(_U('give_money', rob))
end)