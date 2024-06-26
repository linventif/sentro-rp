-- LEAVE THIS LINE
Cosmo.Config = Cosmo.Config or {}
-- LEAVE LINE ABOVE


--[[
    Instance Url
        - This is your site url, so for example our demo is "https://demo.tbdscripts.com"
        - Notice that there is NO trailing paths like /store or /forums
]]
Cosmo.Config.InstanceUrl = "https://sentro.fr/"

--[[
    Donate Command
        - The command which opens your store
]]
Cosmo.Config.DonateCommand = "!boutique"

--[[
    Notification Time
        - The time for which one notification stays visible
]]
Cosmo.Config.NotificationTime = 5

--[[
    Notification Theme
        - The colors and rounding options for the notifications
]]
Cosmo.Config.NotificationTheme = {
    Background = Color(30, 30, 30),
    Header = Color(40, 40, 40),
    HeaderTitle = Color(255, 255, 255),

    Roundness = 6,
}

--[[
    Language
        - Translation strings, mainly for the notification
]]
Cosmo.Config.Language = {
    NotificationTitle = "Achat en magasin",
    NotificationContent = ":player a acheté :package !"
}

--[[
    Log Level
        - You can probably just leave this to the default

    Available Levels
        - Cosmo.Log.LEVEL_DEBUG
        - Cosmo.Log.LEVEL_INFO
        - Cosmo.Log.LEVEL_WARNING
        - Cosmo.Log.LEVEL_DANGER
]]
Cosmo.Config.LogLevel = Cosmo.Log.LEVEL_DEBUG