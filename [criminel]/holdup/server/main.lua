ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('holdup:givemoney')
AddEventHandler('holdup:givemoney', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local randomMoney = math.random(5000, 25000)
	local rob = tonumber(randomMoney)

	xPlayer.addAccountMoney('money', rob)
	xPlayer.showNotification(_U('give_money', rob))
end)