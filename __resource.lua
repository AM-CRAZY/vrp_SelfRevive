description "vRP Self Revive | By CRAZY"

dependency "vrp"

client_scripts{ 
	"lib/Tunnel.lua",
	"lib/Proxy.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
