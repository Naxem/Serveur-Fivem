fx_version 'adamant'
game 'gta5'
author 'Naxem'
description 'Affiche les commissariats et spawn gilet'
version '2.0'

shared_script '@es_extended/imports.lua'

client_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'client.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/fr.lua',
	'config.lua',
	'server.lua'
}

dependency 'es_extended'