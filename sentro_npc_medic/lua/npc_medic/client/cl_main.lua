surface.CreateFont("LinvLibFont08", {
    font = "Segoe UI",
    extended = false,
    size = ScrH()*0.12,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
})

local function AsMedic()
    for k, v in pairs(team.GetAllTeams()) do
        if NPCMedic.Config.MedicJob[v.Name] then
            if team.NumPlayers(k) > 0 then
                return true
            end
        end
    end
    return false
end

net.Receive("NPCMedic", function(len, ply)
    local id = net.ReadString()
    if id == "open" then
        local main_frame = vgui.Create("DFrame")
        main_frame:SetSize(400, 240)
        main_frame:Center()
        main_frame:SetTitle("")
        main_frame:ShowCloseButton(false)
        main_frame:SetDraggable(false)
        main_frame:MakePopup()
        main_frame.Paint = function(self, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            draw.SimpleText("Hôpital", "LinvFontRobo30", w/2, 40, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            if NPCMedic.Config.FreeJob[team.GetName(LocalPlayer():Team())] then
                draw.SimpleText(NPCMedic.GetTranslation("HealthCost") .. 0 .. NPCMedic.Config.MoneySymbol, "LinvFontRobo20", w/2, 90, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(NPCMedic.GetTranslation("AdSpeJob"), "LinvFontRobo20", w/2, 120, Color(104, 163, 230), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            elseif AsMedic() then
                draw.SimpleText(NPCMedic.GetTranslation("HealthCost") .. LinvLib.MoneyToShow(NPCMedic.Config.MoneySeparator, NPCMedic.Config.Cost * NPCMedic.Config.Multi) .. NPCMedic.Config.MoneySymbol, "LinvFontRobo20", w/2, 90, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(NPCMedic.GetTranslation("MedInTow"), "LinvFontRobo20", w/2, 120, Color(217, 98, 98), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText(NPCMedic.GetTranslation("HealthCost") .. LinvLib.MoneyToShow(NPCMedic.Config.MoneySeparator,NPCMedic.Config.Cost) .. NPCMedic.Config.MoneySymbol, "LinvFontRobo20", w/2, 90, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(NPCMedic.GetTranslation("IfMedInTow"), "LinvFontRobo20", w/2, 120, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end

        local buton_health = vgui.Create("DButton", main_frame)
        buton_health:SetSize(130, 50)
        buton_health:SetPos(40, 160)
        buton_health:SetFont("LinvFontRobo20")
        buton_health:SetColor(Color(255, 255, 255))
        buton_health:SetText(NPCMedic.GetTranslation("health"))
        buton_health.Paint = function(self, w, h)
            draw.RoundedBox(4, 0, 0, w, h, Color(113, 113, 113, 255))
            draw.RoundedBox(4, 4, 4, w-8, h-8, Color(55, 55, 55, 255))
        end
        buton_health.DoClick = function()
            net.Start("NPCMedic")
                net.WriteString("heal")
            net.SendToServer()
            main_frame:Close()
        end
        LinvLib.Hover(buton_health, 4, 4, Color(55, 55, 55, 255), Color(63, 63, 63), Color(113, 113, 113), Color(114, 192, 112))

        local buton_close = vgui.Create("DButton", main_frame)
        buton_close:SetSize(130, 50)
        buton_close:SetPos(230, 160)
        buton_close:SetFont("LinvFontRobo20")
        buton_close:SetColor(Color(255, 255, 255))
        buton_close:SetText(NPCMedic.GetTranslation("close"))
        buton_close.Paint = function(self, w, h)
            draw.RoundedBox(4, 0, 0, w, h, Color(113, 113, 113, 255))
            draw.RoundedBox(4, 4, 4, w-8, h-8, Color(55, 55, 55, 255))
        end
        buton_close.DoClick = function()
            main_frame:Close()
        end
        LinvLib.Hover(buton_close, 4, 4, Color(55, 55, 55, 255), Color(63, 63, 63), Color(113, 113, 113), Color(217, 98, 98))
    elseif id == "notif" then
        local data = util.JSONToTable(net.ReadString())
        LinvLib.LNotif(data.msg, data.enum, data.time, "NPC Medic")
    end
end)