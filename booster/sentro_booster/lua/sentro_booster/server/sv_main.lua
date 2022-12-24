util.AddNetworkString("SBooster")
sql.Query("CREATE TABLE IF NOT EXISTS sbooster (id INTEGER PRIMARY KEY AUTOINCREMENT, booster TEXT, player_steamid64 TEXT, date_opened TEXT, date_received TEXT DEFAULT CURRENT_TIMESTAMP)")
sql.Query("CREATE TABLE IF NOT EXISTS sbooster_reward (id INTEGER PRIMARY KEY AUTOINCREMENT, player_steamid64 TEXT, weapon TEXT, date_received TEXT DEFAULT CURRENT_TIMESTAMP)")

local ply_wait = ply_wait || {}

local function PlyHasBooster(ply, booster)
    local query = sql.Query("SELECT * FROM sbooster WHERE player_steamid64 = '" .. ply:SteamID64() .. "' AND booster = '" .. booster .. "' AND date_opened IS NULL")
    if query then
        return query
    else
        return false
    end
end

local function PlyHasBoosters(ply)
    local query = sql.Query("SELECT * FROM sbooster WHERE player_steamid64 = '" .. ply:SteamID64() .. "' AND date_opened IS NULL")
    if query then
        return query
    else
        return false
    end
end

local function PlyGiveBooster(ply, booster)
    sql.Query("INSERT INTO sbooster (booster, player_steamid64) VALUES ('" .. booster .. "', '" .. ply .. "')")
end

local function PlyOpenBooster(ply, booster)
    if !SBooster.Config.Bosters[booster] then
        print("Invalid Booster")
        return
    end
    if !PlyHasBooster(ply, booster) then
        print("Player doesn't have this booster")
        return
    end
    local query = sql.Query("SELECT * FROM sbooster WHERE player_steamid64 = '" .. ply:SteamID64() .. "' AND booster = '" .. booster .. "' AND date_opened IS NULL")
    if query then
        sql.Query("UPDATE sbooster SET date_opened = CURRENT_TIMESTAMP WHERE id = " .. query[1].id)
        local reward, reward_all = {}, {}
        local possible_rewards = table.GetKeys(SBooster.Config.Bosters[booster].reward)
        for i = 1, 3 do
            local the_reward = possible_rewards[math.random(#possible_rewards)]
            reward[i] = the_reward
            reward_all[the_reward] = true
        end
        ply_wait[ply] = reward_all
        //PrintTable(reward)
        return {booster = booster, weps = reward}
    end
end

function SBooster.GetWeapons(ply)
    local weps = {}
    local query = sql.Query("SELECT * FROM sbooster_reward WHERE player_steamid64 = '" .. ply:SteamID64() .. "'")
    if query then
        if #query > 0 then
            for _, row in pairs(query) do
                weps[row.weapon] = true
            end
            return weps
        end
    end
    return false
end

concommand.Add("booster_give", function(ply, cmd, args)
    local booster = args[2]
    if !booster || !SBooster.Config.Bosters[booster] then
        print("Invalid Booster")
        return
    end
    PlyGiveBooster(args[1], booster)
    print("The player " .. args[1] .. " has been given the booster " .. booster)
end)

net.Receive("SBooster", function(len, ply)
    local id = net.ReadString()
    if id == "open" then
        if PlyHasBoosters(ply) then
            local reward = PlyOpenBooster(ply, net.ReadString())
            if reward then
                net.Start("SBooster")
                    net.WriteString("open-pack")
                    net.WriteString(util.TableToJSON(reward))
                net.Send(ply)
            else
                ply:ChatPrint("Booster not found")
            end
        else
            ply:ChatPrint("You don't have any booster")
        end
    elseif id == "chose" then
        local chose = net.ReadString()
        if !ply_wait[ply] then
            ply:ChatPrint("You don't have any booster in waiting")
            return
        end
        if !ply_wait[ply][chose] then
            ply:ChatPrint("You don't have this reward in waiting")
            return
        end
        ply_wait[ply] = nil
        sql.Query("INSERT INTO sbooster_reward (player_steamid64, weapon) VALUES ('" .. ply:SteamID64() .. "', '" .. chose .. "')")
        ply:ChatPrint("You have received the reward: " .. SBooster.Config.Weapon[chose].name)
    elseif id == "get" then
        net.Start("SBooster")
            net.WriteString("get")
            net.WriteString(util.TableToJSON(PlyHasBoosters(ply) || {}))
        net.Send(ply)
    end
end)

/*

hook.Add("PlayerSpawn", "SBooster", function(ply)
    local booster_weapons = SBooster.GetWeapons(ply)
    if booster_weapons then
        for k, v in pairs(booster_weapons) do
            ply:Give(k)
            ply:ChatPrint("You have a booster weapon: " .. k)
        end
    end
end)


-- for _, ply in pairs(player.GetAll()) do
--     local query = sql.Query("SELECT * FROM sbooster_reward WHERE player_steamid64 = '" .. ply:SteamID64() .. "'")
--     if query then
--         if #query > 0 then
--             for _, row in pairs(query) do
--                 print(" - - - - ")
--                 print("id: " .. row.id)
--                 print("player_steamid64: " .. row.player_steamid64)
--                 print("reward: " .. row.reward)
--                 print("amount: " .. row.amount)
--                 print("date_received: " .. row.date_received)
--                 print(" - - - - ")
--                 if reward_type == "weapon" then
--                     ply:Give(row.reward)
--                 end
--             end
--         end
--     end
-- end

// Exemple of use
for _, ply in pairs(player.GetAll()) do
    //PlyGiveBooster(ply:SteamID64(), "test")
    if PlyHasBoosters(ply) then
        // print the number of boosters for all types
        local boosters = {}
        for _, booster in pairs(PlyHasBoosters(ply)) do
            if boosters[booster.booster] then
                boosters[booster.booster] = boosters[booster.booster] + 1
            else
                boosters[booster.booster] = 1
            end
        end
        for booster, amount in pairs(boosters) do
            print(ply:Nick() .. " has " .. amount .. " of " .. booster)
        end
    else
        print(ply:Nick() .. " doesn't have boosters")
    end
end


for _, ply in pairs(player.GetAll()) do
    if !ply:IsValid() then return end
    local booster_weapons = SBooster.GetWeapons(ply)
    if booster_weapons then
        PrintTable(booster_weapons)
    end
    if PlyHasBoosters(ply) then
        local reward = PlyOpenBooster(ply, "test")
        net.Start("SBooster")
            net.WriteString("chosen_reward")
            net.WriteString(util.TableToJSON(reward))
        net.Send(ply)
    else
        print(ply:Nick() .. " doesn't have boosters")
    end
end
*/