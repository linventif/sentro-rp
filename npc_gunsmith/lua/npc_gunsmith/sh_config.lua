// -- // -- // -- // -- // -- // -- // -- //
//                                        //
//            General Settings            //
//                                        //
// -- // -- // -- // -- // -- // -- // -- //

// General Settings
NPCGun.Config.Language = "french" // Language (english - french - spanish - russian) you can add your own language in sh_language.lua
NPCGun.Config.Multi = 4 // Multiplicator of cost if they have medic

// Money Settings
NPCGun.Config.MoneySymbol = "€" // Symbol of the money
NPCGun.Config.MoneySeparator = " " // Separator of the money

// NPC Settings
NPCGun.Config.NPCName = "Armurier" // Name of the NPC

// Job Settings
NPCGun.Config.GunsmithJob = { // Jobs that can heal for free
    ["Gun Dealer"] = true
}
NPCGun.Config.FreeJob = { // Jobs that can heal for free
    ["Medic"] = true,
    ["medicchief"] = true
}

NPCGun.Config.Weapons = {
    ["weapon_rpg"] = {
        ["name"] = "Pistolet",
        ["price"] = 1000,
        ["model"] = "models/weapons/w_pistol.mdl"
    },
    ["weapon_ar2"] = {
        ["name"] = "JSP",
        ["price"] = 1000,
        ["model"] = "models/weapons/w_pistol.mdl"
    },
    ["weapon_357"] = {
        ["name"] = "weapon_357",
        ["price"] = 1000,
        ["model"] = "models/weapons/w_pistol.mdl"
    },
    ["weapon_pistol4"] = {
        ["name"] = "Pistolet",
        ["price"] = 1000,
        ["model"] = "models/weapons/w_pistol.mdl"
    }
}