print(" ")
print(" ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" -                                                           - ")
print(" -                 Sentro Permanent Weapon                   - ")
print(" -                                                           - ")
print(" -                   Create by Linventif                     - ")
print(" -                                                           - ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" ")

local folder = "sentro_perma"
local name = "Sentro Permanent Weapon"

Sentro_Perma = {}
Sentro_Perma.Version = 1

// Load Config File
AddCSLuaFile(folder .. "/sh_config.lua")
include(folder .. "/sh_config.lua")

// Load Language File
AddCSLuaFile(folder .. "/languages/" .. string.lower(Sentro_Perma.Config.Language) .. ".lua")
include(folder .. "/languages/" .. string.lower(Sentro_Perma.Config.Language) .. ".lua")
print("| " .. name .. " | File Load | addons/" .. folder .. "/lua/" .. folder .. "/languages/" .. string.lower(Sentro_Perma.Config.Language) .. ".lua")

// Load Other Files
if SERVER then
    if !file.Exists("sentro_perma", "data") then
        file.CreateDir("sentro_perma")
    end

	for k, v in ipairs(file.Find(folder .. "/server/*.lua", "LUA")) do
		include(folder .. "/server/" .. v)
        print("| " .. name .. " | File Load | addons/" .. folder .. "/lua/" .. folder .. "/server/" .. v)
	end

	for k, v in ipairs(file.Find(folder .. "/client/*.lua", "LUA")) do
        print("| " .. name .. " | File Load | addons/" .. folder .. "/lua/" .. folder .. "/client/" .. v)
		AddCSLuaFile(folder .. "/client/" .. v)
	end
else
	for k, v in ipairs(file.Find(folder .. "/server/*.lua", "LUA")) do
		include(folder .. "/server/" .. v)
        print("| " .. name .. " | File Load | addons/" .. folder .. "/lua/" .. folder .. "/server/" .. v)
	end

	for k, v in ipairs(file.Find(folder .. "/client/*.lua", "LUA")) do
		include(folder .. "/client/" .. v)
        print("| " .. name .. " | File Load | addons/" .. folder .. "/lua/" .. folder .. "/client/" .. v)
	end
end

print(" ")
print(" ")