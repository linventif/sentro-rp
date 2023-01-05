Sentro_Perma.Config = {}

Sentro_Perma.Config.Language = "French"

Sentro_Perma.Config.Shop = "https://sentroboutique.fr/"
Sentro_Perma.Config.Workshop = "https://steamcommunity.com/sharedfiles/filedetails/?id=2804492584"

Sentro_Perma.Config.FastDL = true

Sentro_Perma.UI = {
    ["Background"] = Color(30, 30, 30),
    ["Invisible"] = Color(0, 0, 0, 0),
    ["Border"] = Color(184, 184, 184),
    ["Main"] = Color(61, 61, 61),
    ["Text"] = Color(255, 255, 255)
}

Sentro_Perma.Config.Weapons = {
    ["health"] = {
        ["Name"] = "+100 de Santé",
        ["Icon"] = "materials/sentro_perma/health.png"
    },
    ["armor"] = {
        ["Name"] = "+100 de Kevlar",
        ["Icon"] = "materials/sentro_perma/kevlar.png"
    },
    ["tfa_ins2_arx160"] = {
        ["Name"] = "ARX-416",
        ["Icon"] = "materials/sentro_perma/riffle.png"
    },
    ["tfa_ins2_deagle"] = {
        ["Name"] = "Desert Eagle",
        ["Icon"] = "materials/sentro_perma/pistol.png"
    },
    ["tfa_ins2_warface_orsis_t5000"] = {
        ["Name"] = "Orsis T5000",
        ["Icon"] = "materials/sentro_perma/sniper.png"
    },
    ["awpdragon"] = {
        ["Name"] = "AWP",
        ["Icon"] = "materials/sentro_perma/sniper.png"
    },
    ["tfa_ins2_417"] = {
        ["Name"] = "HK-417",
        ["Icon"] = "materials/sentro_perma/riffle.png"
    },
    ["tfa_ins2_rhino"] = {
        ["Name"] = "Rhino",
        ["Icon"] = "materials/sentro_perma/pistol.png"
    },
    ["tfa_ins2_rpk_74m"] = {
        ["Name"] = "RPK-74M",
        ["Icon"] = "materials/sentro_perma/riffle.png"
    },
    ["csgo_karambit_autotronic"] = {
        ["Name"] = "Karambit",
        ["Icon"] = "materials/sentro_perma/knife.png"
    },
    ["realistic_hook"] = {
        ["Name"] = "Grappin",
        ["Icon"] = "materials/sentro_perma/pistol.png"
    },
    ["lockpick"] = {
        ["Name"] = "Lockpick",
        ["Icon"] = "materials/sentro_perma/point_of_intero.png"
    },
    ["bkeypads_cracker"] = {
        ["Name"] = "Keypad Crack",
        ["Icon"] = "materials/sentro_perma/point_of_intero.png"
    },
    ["tfa_ins2_m500"] = {
        ["Name"] = "M500",
        ["Icon"] = "materials/sentro_perma/shutgun.png"
    },
}

Sentro_Perma.Config.Special = {
    ["health"] = function(ply)
        ply:SetMaxHealth(ply:GetMaxHealth() + 100)
        ply:SetHealth(ply:GetMaxHealth())
    end,
    ["armor"] = function(ply)
        ply:SetMaxArmor(100)
        ply:SetArmor(ply:GetMaxArmor())
    end,
    ["ammo"] = function(ply)
        for k, v in pairs(table.GetKeys(game.GetAmmoTypes())) do
            ply:SetAmmo(9999, v)
        end
    end,
    ["speed"] = function(ply)
        ply:SetSlowWalkSpeed(ply:GetSlowWalkSpeed() * 1.2)
        ply:SetWalkSpeed(ply:GetWalkSpeed() * 1.2)
        ply:SetRunSpeed(ply:GetRunSpeed() * 1.2)
        ply:SetMaxSpeed(ply:GetMaxSpeed() * 1.2)
    end
}