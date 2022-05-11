ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('commissariat:givevest')
AddEventHandler('commissariat:givevest', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(1000)
	xPlayer.showNotification(_U('achat', 1000))
end)