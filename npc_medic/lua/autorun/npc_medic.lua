if !LinvLib then
    print(" ")
    print(" ")
    print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
    print(" -                                                           - ")
    print(" -               Linventif Library is missing !              - ")
    print(" -                                                           - ")
    print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
    print(" ")
    print("Linventif Library is missing ! Please install it !")
    print(" ")
    print("You can download the latest version here : https://github.com/linventif/gmod-lib")
    print("Or you can download it directly from the workshop : https://steamcommunity.com/sharedfiles/filedetails/?id=2882747990")
    print("If you have any questions, you can join my discord : https://linventif.fr/discord")
    print("If you don't download it, you won't be able to use my creations.")
    print(" ")
    print(" ")
    return
end

// -- // -- // -- // -- // -- // -- // -- // -- // -- //

local folder = "npc_medic"
local name = "NPC Medic"
local full_name = "NPC Medic"
local workshop = {}
local license = "CC BY-SA 4.0"
local version = "0.1.0"

NPCMedic = {}
NPCMedic.Config = {}
LinvLib.Install["npc-medic"] = version

// -- // -- // -- // -- // -- // -- // -- // -- // -- //

LinvLib.Load(name, folder, {"sh_config.lua", "sh_language.lua"})

if SERVER then
    LinvLib.LoadWorkshop(workshop, name)
    LinvLib.LoadMaterials(folder .. "/materials", name)
end

LinvLib.Loader(folder .. "/server", name)
LinvLib.Loader(folder .. "/client", name)
LinvLib.LoadStr(full_name, version, license)

print(" ")
print(" ")