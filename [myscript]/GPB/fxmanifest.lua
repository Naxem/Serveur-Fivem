fx_version 'adamant'
game 'gta5'
author 'Naxem'
description 'GPB'
version '1.0'

shared_script '@es_extended/imports.lua'

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'server/main.lua'
}

dependency 'es_extended'