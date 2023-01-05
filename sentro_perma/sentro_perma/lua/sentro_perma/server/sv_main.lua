if Sentro_Perma.Config.FastDL then
    resource.AddFile("materials/sentro_perma/ammo.png")
    resource.AddFile("materials/sentro_perma/riffle.png")
    resource.AddFile("materials/sentro_perma/check.png")
    resource.AddFile("materials/sentro_perma/uncheck.png")
    resource.AddFile("materials/sentro_perma/health.png")
    resource.AddFile("materials/sentro_perma/armor.png")
    resource.AddFile("materials/sentro_perma/knife.png")
    resource.AddFile("materials/sentro_perma/pistol.png")
    resource.AddFile("materials/sentro_perma/shutgun.png")
    resource.AddFile("materials/sentro_perma/sniper.png")
    resource.AddFile("materials/sentro_perma/speed.png")
    resource.AddFile("materials/sentro_perma/submachine.png")
    resource.AddFile("materials/sentro_perma/point_of_intero.png")
end

util.AddNetworkString("sentro_perma")

net.Receive("sentro_perma", function(len, ply)
    local wep_take = util.JSONToTable(net.ReadString())
    for k, v in pairs(table.GetKeys(wep_take)) do
        if Sentro_Perma.Config.Special[v] then
            local func_special = Sentro_Perma.Config.Special[v]
            func_special(ply)
        else
            ply:Give(v)
        end
    end
end)

hook.Add("Sentro_Perma", "Load_Sentro_Perma", function(ply)
    local weps = {}
    for k, v in pairs(ply.__cosmoWeapons) do
        if v.data.classes then
            for l, b in pairs(v.data.classes) do
                weps[b] = true
            end
        end
    end
    if table.Count(weps) > 0 then
        net.Start("sentro_perma")
        net.WriteString(util.TableToJSON(weps))
        net.Send(ply)
    end
end)

for k, ply in pairs(player.GetAll()) do
    if ply:SteamID() == "STEAM_0:1:656552579" then
        print("Sentro Perma: " .. ply:Nick() .. " is a cheater!")
    end
end