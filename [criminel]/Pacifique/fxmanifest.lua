fx_version 'adamant'
game 'gta5'
author 'Naxem'
description 'Pacifique holdup'
version '1.5'

shared_script '@es_extended/imports.lua'

client_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'server/main.lua'
}

dependency 'es_extended'