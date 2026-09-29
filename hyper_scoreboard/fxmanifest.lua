fx_version("cerulean")
game("gta5")

description("Scoreboard")
author("hyper0939")
version("0.0.1")

client_scripts({
	"Code/client-side.lua",
})

server_scripts({
	"Code/server-side.lua",
})

shared_scripts({
	"config.lua",
})

ui_page("UI/index.html")

files({
	"UI/index.html",
	"UI/index.css",
	"UI/index.js",
	"UI/images/*.svg",
	"UI/images/*.png",
})
