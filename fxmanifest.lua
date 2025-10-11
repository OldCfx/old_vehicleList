fx_version 'cerulean'
game 'gta5'

name "old_vehicleList"
description "list all vehicle"
author "OldMoney"
version "1.0.0"

shared_scripts {
	'shared/*.lua'
}

client_scripts {
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}


ui_page 'ui/index.html'

files {
	'ui/index.html',
	'ui/static/**'
}
