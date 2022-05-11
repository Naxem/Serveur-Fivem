ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('hopital:removecash50')
AddEventHandler('hopital:removecash50', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(3500)
	xPlayer.showNotification(_U('achat', 3500))
end)

RegisterServerEvent('hopital:removecash100')
AddEventHandler('hopital:removecash100', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(3000)
	xPlayer.showNotification(_U('achat', 3000))
end)

RegisterServerEvent('hopital:removecash150')
AddEventHandler('hopital:removecash150', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(2500)
	xPlayer.showNotification(_U('achat', 2500))
end)

RegisterServerEvent('hopital:removecash200')
AddEventHandler('hopital:removecash200', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(2000)
	xPlayer.showNotification(_U('achat', 2000))
end)