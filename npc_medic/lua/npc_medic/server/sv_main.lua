util.AddNetworkString("NPCMedic")

local function AsMedic()
    for k, v in pairs(team.GetAllTeams()) do
        if NPCMedic.Config.MedicJob[v.Name] then
            if team.NumPlayers(k) > 0 then
                return true
            end
        end
    end
    return false
end

net.Receive("NPCMedic", function(len, ply)
    local action = net.ReadString()
    if action == "heal" then
        local cost = NPCMedic.Config.Cost
        if AsMedic() then
            cost = NPCMedic.Config.Cost * NPCMedic.Config.Multi
        end
        if ply:Alive() and ply:Health() < ply:GetMaxHealth() then
            if NPCMedic.Config.FreeJob[team.GetName(ply:Team())] then
                cost = 0
            end
            if ply:getDarkRPVar("money") >= cost then
                ply:setDarkRPVar("money", ply:getDarkRPVar("money") - cost)
                ply:SetHealth(ply:GetMaxHealth())
                ply:ChatPrint(NPCMedic.GetTranslation("YouHasHeal"))
            else
                ply:ChatPrint(NPCMedic.GetTranslation("NoMoney"))
            end
        else
            ply:ChatPrint(NPCMedic.GetTranslation("FullHeal"))
        end
    end
end)