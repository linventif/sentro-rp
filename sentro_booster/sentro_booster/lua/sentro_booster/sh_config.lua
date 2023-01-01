// -- // -- // -- // -- // -- // -- // -- //
//                                        //
//           General Settings             //
//                                        //
// -- // -- // -- // -- // -- // -- // -- //

// General Settings
SBooster.Config.Language = "french" // Language (english - french - spanish - russian) you can add your own language in sh_language.lua
SBooster.Config.URLStore = "https://sentro.fr/store/servers/4" // URL of the store
SBooster.Config.DefaulImage = "nHb3fqn" // Default image of the booster

// NPC Settings
SBooster.Config.NPCName = "Booster" // Name of the NPC
SBooster.Config.NPCModel = "models/Humans/Group01/Female_01.mdl" // Model of the NPC

// Money Settings
SBooster.Config.MoneySymbol = "$" // Symbol of the money
SBooster.Config.MoneySeparator = "," // Separator of the money

// Command Settings
SBooster.Config.Commands = { // Commands to open the menu
    ["!booster"] = true,
    ["!boostermenu"] = true,
    ["/booster"] = true,
    ["/boostermenu"] = true
}

// Boster Settings
SBooster.Config.Bosters = {
    ["1"] = {
        ["name"] = "Legendary",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(206, 189, 95),
        ["reward"] = {
            ["ls_sniper"] = true,
            ["weapon_357"] = true,
            ["weapon_mp52"] = true,
            ["weapon_ak47"] = true,
            ["weapon_shotgun"] = true,
            ["weapon_pistol"] = true,
            ["weapon_rpg"] = true
        }
    },
    ["2"] = {
        ["name"] = "Epic",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(175, 37, 175),
        ["reward"] = {
            ["ls_sniper"] = true,
            ["weapon_357"] = true,
            ["weapon_mp52"] = true,
            ["weapon_ak47"] = true,
            ["weapon_shotgun"] = true,
            ["weapon_pistol"] = true,
            ["weapon_rpg"] = true
        }
    },
    ["3"] = {
        ["name"] = "Rare",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(74, 165, 55),
        ["reward"] = {
            ["ls_sniper"] = true,
            ["weapon_357"] = true,
            ["weapon_mp52"] = true,
            ["weapon_ak47"] = true,
            ["weapon_shotgun"] = true,
            ["weapon_pistol"] = true,
            ["weapon_rpg"] = true
        }
    },
    ["4"] = {
        ["name"] = "Common",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(46, 151, 177),
        ["reward"] = {
            ["ls_sniper"] = true,
            ["weapon_357"] = true,
            ["weapon_mp52"] = true,
            ["weapon_ak47"] = true,
            ["weapon_shotgun"] = true,
            ["weapon_pistol"] = true,
            ["weapon_rpg"] = true
        }
    },
    ["5"] = {
        ["name"] = "Sniper",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(113, 113, 113),
        ["reward"] = {
            ["ls_sniper"] = true,
            ["weapon_357"] = true,
            ["weapon_mp52"] = true,
            ["weapon_ak47"] = true,
            ["weapon_shotgun"] = true,
            ["weapon_pistol"] = true,
            ["weapon_rpg"] = true
        }
    },
    ["6"] = {
        ["name"] = "Rifle",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(113, 113, 113),
        ["reward"] = {
            ["ls_sniper"] = true,
            ["weapon_357"] = true,
            ["weapon_mp52"] = true,
            ["weapon_ak47"] = true,
            ["weapon_shotgun"] = true,
            ["weapon_pistol"] = true,
            ["weapon_rpg"] = true
        }
    },
    ["7"] = {
        ["name"] = "Shotgun",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(113, 113, 113),
        ["reward"] = {
            ["ls_sniper"] = true,
            ["weapon_357"] = true,
            ["weapon_mp52"] = true,
            ["weapon_ak47"] = true,
            ["weapon_shotgun"] = true,
            ["weapon_pistol"] = true,
            ["weapon_rpg"] = true
        }
    },
    ["8"] = {
        ["name"] = "Pistol",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(113, 113, 113),
        ["reward"] = {
            ["ls_sniper"] = true,
            ["weapon_357"] = true,
            ["weapon_mp52"] = true,
            ["weapon_ak47"] = true,
            ["weapon_shotgun"] = true,
            ["weapon_pistol"] = true,
            ["weapon_rpg"] = true
        }
    }
}

// Boster Settings
SBooster.Config.Weapon = {
    ["ls_sniper"] = {
        ["name"] = "Sniper",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(151, 27, 27)
    },
    ["weapon_mp52"] = {
        ["name"] = "MP5",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(81, 74, 170)
    },
    ["weapon_ak47"] = {
        ["name"] = "AK47",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(74, 170, 90)
    },
    ["weapon_shotgun"] = {
        ["name"] = "Shotgun",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(148, 74, 170)
    },
    ["weapon_pistol"] = {
        ["name"] = "Pistol",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(81, 74, 170)
    },
    ["weapon_rpg"] = {
        ["name"] = "RPG",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(170, 168, 74)
    },
    ["weapon_357"] = {
        ["name"] = "Deagle",
        ["imgur"] = "XYSg1Pz",
        ["color"] = Color(74, 170, 165)
    }
}