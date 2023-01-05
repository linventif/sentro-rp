// If you want to add a official default theme, contact me on discord: https://linventif.fr/discord

local theme = {
    ["sentro"] = {
        ["border"] = Color(115, 115, 115),
        ["background"] = Color(55, 55, 55),
        ["text"] = Color(255, 255, 255),
        ["inter"] = Color(115, 115, 115),
        ["active"] = Color(150, 104, 24),
        ["Button"] = {
            ["background"] = Color(55, 55, 55),
            ["border"] = Color(115, 115, 115),
            ["text"] = Color(255, 255, 255),
            ["hover"] = Color(85, 85, 85),
            ["hover_border"] = Color(115, 115, 115),
        }
    }
}

// Do not edit below this line !!
FriendsSys.Config.Color = theme[FriendsSys.Config.Theme] || theme["dark"]