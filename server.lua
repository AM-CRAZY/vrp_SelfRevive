-- Edited By CRAZY

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_SelfRevive")

PER = "EMS.heal.me" -- البرمشن

local selfrevive = {function (player)
	vRPclient.isInComa(player,{},function (coma)
		if coma then
			vRPclient.varyHealth(player,{100})
		else
			--vRPclient.notify(source,{"~r~You are not in coma."})
			TriggerClientEvent("pNotify:SendNotification",source,{text = "<span color='red'>[ انت ليس ميت حتى تنعش نفسك ]</span>", type = "info", timeout = (6000),layout = "centerLeft"})
		end
	end)
end,"لانعاش نفسك اذا ميت"}

RegisterCommand('healme', function(player, args, rawCommand)
  local user_id = vRP.getUserId({player})
 if vRP.hasPermission({user_id,"admin.revive"}) then
	vRPclient.isInComa(player,{},function (coma)
		if coma then
			vRPclient.varyHealth(player,{100})
		else
			--vRPclient.notify(source,{"~r~You are not in coma."})
			TriggerClientEvent("pNotify:SendNotification",source,{text = "<span color='red'>[ انت ليس ميت حتى تنعش نفسك ]</span>", type = "info", timeout = (6000),layout = "centerLeft"})
        end 
    end)
 end
end)

vRP.registerMenuBuilder({"main", function(add, data)
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
	
		if vRP.hasPermission({user_id,PER}) then
			choices["انعاش نفسي"] = selfrevive
		end
		add(choices)
	end
end})
