util.AddNetworkString("NPCGun")

local function AsGunsmith()
    for k, v in pairs(team.GetAllTeams()) do
        if NPCGun.Config.GunsmithJob[v.Name] then
            if team.NumPlayers(k) > 0 then
                return true
            end
        end
    end
    return false
end

net.Receive("NPCGun", function(len, ply)
    local action = net.ReadString()
    if action == "buy" then
        local wep = net.ReadString()
        local price = NPCGun.Config.Weapons[wep].price
        if AsGunsmith() then
            price = price * NPCGun.Config.Multi
        end
        if ply:canAfford(price) then
            ply:addMoney(-price)
            ply:Give(wep)
            ply:SelectWeapon(wep)
            ply:ChatPrint(NPCGun.GetTranslation(7))
        else
            ply:ChatPrint(NPCGun.GetTranslation(8))
        end
    end
end)