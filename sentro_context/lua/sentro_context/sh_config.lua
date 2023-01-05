// -- // -- // -- // -- // -- // -- // -- //
//                                        //
//           General Settings             //
//                                        //
// -- // -- // -- // -- // -- // -- // -- //

SentroContext.Config.Language = "french" // Language (french - english) you can add your own language in sh_language.lua
SentroContext.Config.Admin = { // Admins
    ["superadmin"] = true,
    ["admin"] = true,
    ["moderator"] = true
}

SentroContext.Config.Content = {
    [1] = {
        ["name"] = "Raccourcis Liens",
        ["admin"] = false,
        ["buttons"] = {
            [1] = {
                ["name"] = "Collection",
                ["url"] = "https://steamcommunity.com/id/steamid/collection/steamid"
            },
            [2] = {
                ["name"] = "Discord",
                ["url"] = "https://discord.gg/steamid"
            },
            [3] = {
                ["name"] = "Forum",
                ["url"] = "https://steamid.fr"
            },
            [4] = {
                ["name"] = "Boutique",
                ["url"] = "https://steamid.fr/shop"
            }
        }
    },
    [2] = {
        ["name"] = "Raccourcis Commandes",
        ["admin"] = false,
        ["buttons"] = {
            [1] = {
                ["name"] = "Stop Sound",
                ["command"] = "stopsound"
            },
            [2] = {
                ["name"] = "Changer de Vue",
                ["command"] = "simple_thirdperson_enable_toggle"
            },
            [3] = {
                ["name"] = "Inventaire",
                ["command"] = "inv"
            },
            [4] = {
                ["name"] = "Lacher Armes",
                ["chat"] = "/drop"
            },
            [5] = {
                ["name"] = "Deposer Argent",
                ["special"] = "dropmoney"
            },
            [6] = {
                ["name"] = "Body Group",
                ["command"] = "bodygroup"
            },
            [7] = {
                ["name"] = "Appeler un Staff",
                ["chat"] = "!ticket"
            },
            [8] = {
                ["name"] = "Menu des Emote",
                ["chat"] = "!emote"
            },
            [9] = {
                ["name"] = "Menu des Amis",
                ["chat"] = "!friends"
            },
            [10] = {
                ["name"] = "Color Modificator",
                ["chat"] = "!color"
            }
        }
    },
    [3] = {
        ["name"] = "Raccourcis Commandes Staff",
        ["admin"] = true,
        ["buttons"] = {
            [1] = {
                ["name"] = "Menu Staff",
                ["chat"] = "!menu"
            },
            [2] = {
                ["name"] = "Menu des Warn",
                ["chat"] = "!warn"
            },
            [3] = {
                ["name"] = "Menu des Logs",
                ["chat"] = "!blogs"
            },
            [4] = {
                ["name"] = "Mode Staff",
                ["chat"] = "!admin"
            }
        }
    }
}

SentroContext.Config.BlacklistWeps = {
    ["pistol"] = true
}

SentroContext.Config.Color = {
    ["border"] = Color(115, 115, 115),
    ["background"] = Color(55, 55, 55),
    ["text"] = Color(255, 255, 255),
    ["inter"] = Color(200, 200, 200),
    ["hover"] = Color(85, 85, 85),
    ["red"] = Color(194, 108, 108),
    ["green"] = Color(114, 192, 112),
}