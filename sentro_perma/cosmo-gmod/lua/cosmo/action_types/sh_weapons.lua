local WEAPONS = Cosmo.ActionType.New("weapons")

function WEAPONS:HandlePurchase(action, order, ply)
    local weaponClasses = action.data.classes or {}
    local isPermanent = action.data.perm == "1"

    if isPermanent then
        ply.__cosmoWeapons = ply.__cosmoWeapons or {}
        table.insert(ply.__cosmoWeapons, action)
    end

    return true
end

function WEAPONS:HandleExpiration(action, order, ply)
    local actionId = action.id
    if not actionId then return false end

    for i, wAction in pairs(ply.__cosmoWeapons) do
        if actionId == wAction.id then
            ply.__cosmoWeapons[i] = nil
            break
        end
    end

    return true
end

hook.Add("PlayerInitialSpawn", "Cosmo.Store.Weapons", function(ply)
    Cosmo.Http:DoRequest("GET", "/store/weapons/" .. ply:SteamID64())
        :Then(function(data)
            if not IsValid(ply) or not istable(data) then return end

            local wepClasses = {}

            for _, action in ipairs(data) do
                if action.data.perm ~= "1" then continue end
                if not istable(action.data.classes) then continue end

                table.insert(wepClasses, action)
            end

            ply.__cosmoWeapons = wepClasses
            hook.Run("Sentro_Perma", ply)
        end)
        :Catch(function(reason)
            Cosmo.Log.Warning("(WEAPONS)", "Failed to load permanent weapons for player:", ply:SteamID64())
        end)
end)

hook.Add("PlayerLoadout", "Cosmo.Store.Weapons", function(ply)
    if not ply.__cosmoWeapons then return end
    hook.Run("Sentro_Perma", ply)
end)

hook.Add("canDropWeapon", "Cosmo.Store.Weapons", function(ply, weapon)
    if weapon.__cosmo then return false end
end)

Cosmo.ActionType.Register(WEAPONS)