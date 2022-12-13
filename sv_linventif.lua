util.AddNetworkString("Sentro:Start")

net.Receive("Sentro:Start", function(len, ply)
    ply:UnSpectate()
    ply:GodDisable()
    ply:Spawn()
end)

hook.Add("PlayerInitialSpawn", "Sentro:Start:PlayerInitialSpawn", function(ply)
    timer.Simple(1, function()
        ply:Spectate(OBS_MODE_FIXED)
        ply:SetModel("models/player/alyx.mdl")
        ply:StripWeapons()
        ply:Give("gmod_camera")
        ply:SetPos(Vector(-1839, 376, 1556))
        ply:SetEyeAngles(Angle(0, 90, 0))
        ply:PhysicsDestroy()
        ply:SetNoDraw(true)
        ply:GodEnable()
        ply:SetNotSolid(true)
    end)
end)