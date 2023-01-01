local function AsGunsmith()
    for k, v in pairs(team.GetAllTeams()) do
        if NPCGun.Config.GunsmithJob[v.Name] then
            if team.NumPlayers(k) > 0 then
                return true
            end
        end
    end
    return false
end

net.Receive("NPCGun", function(len, ply)
    local id = net.ReadString()
    if id == "open" then
        local main_frame = vgui.Create("DFrame")
        main_frame:SetSize(500, 640)
        main_frame:Center()
        main_frame:SetTitle("")
        main_frame:ShowCloseButton(false)
        main_frame:SetDraggable(false)
        main_frame:MakePopup()
        main_frame.Paint = function(self, w, h)
            draw.RoundedBox(8, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            draw.SimpleText(NPCGun.Config.NPCName, "LinvFontRobo30", w/2, 40, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            if AsGunsmith() then
                draw.SimpleText(NPCGun.GetTranslation(2), "LinvFontRobo20", w/2, 88, Color(217, 98, 98), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText(NPCGun.GetTranslation(3), "LinvFontRobo20", w/2, 112, Color(217, 98, 98), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText(NPCGun.GetTranslation(1), "LinvFontRobo20", w/2, 95, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end

        local frame_scroll = vgui.Create("DPanel", main_frame)
        frame_scroll:SetPos(25, 140)
        frame_scroll:SetSize(450, 390)
        frame_scroll.Paint = function(s, w, h)
            draw.RoundedBox(4, 0, 0, w, h, Color(0, 0, 0, 0))
        end

        local wep_scroll = vgui.Create("DScrollPanel", frame_scroll)
        wep_scroll:Dock(FILL)

        local vbar = wep_scroll.VBar
        vbar:SetHideButtons(true)
        function vbar.btnUp:Paint(w, h) end
        function vbar:Paint(w, h) end
        function vbar.btnGrip:Paint(w, h) end

        wep_scroll.VBar:SetHideButtons(true)
        wep_scroll.VBar.Paint = function() end

        wep_scroll.VBar:SetWide(0)
        wep_scroll.VBar.btnUp.Paint = wep_scroll.VBar.Paint
        wep_scroll.VBar.btnDown.Paint = wep_scroll.VBar.Paint
        wep_scroll.VBar.btnGrip.Paint = function(self, w, h) end

        for k, v in pairs(NPCGun.Config.Weapons) do
            local wep_panel = wep_scroll:Add("DPanel")
            wep_panel:SetSize(410, 40)
            wep_panel:Dock(TOP)
            wep_panel:DockMargin(0, 0, 0, 15)
            wep_panel:SetSize(450, 100)
            wep_panel.Paint = function(self, w, h)
                draw.RoundedBox(4, 0, 0, w, h, Color(113, 113, 113, 255))
                draw.RoundedBox(4, 4, 4, w-8, h-8, Color(55, 55, 55, 255))
                draw.SimpleText(v.name, "LinvFontRobo20", 100, 35, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                if AsGunsmith() then
                    draw.SimpleText(LinvLib.MoneyToShow(NPCGun.Config.MoneySeparator, v.price * NPCGun.Config.Multi) .. NPCGun.Config.MoneySymbol, "LinvFontRobo20", 100, 65, Color(217, 98, 98), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                else
                    draw.SimpleText(LinvLib.MoneyToShow(NPCGun.Config.MoneySeparator, v.price) .. NPCGun.Config.MoneySymbol, "LinvFontRobo20", 100, 65, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                end
            end
            local wep_icon = vgui.Create("SpawnIcon", wep_panel)
            wep_icon:SetSize(90, 90)
            wep_icon:SetPos(5, 5)
            wep_icon:SetModel(v.model)
            wep_icon:SetToolTip(false)
            wep_icon.OnMousePressed = function() end
            wep_icon.PaintOver = function() end

            local buton_buy = vgui.Create("DButton", wep_panel)
            buton_buy:SetSize(130, 50)
            buton_buy:SetPos(290, 25)
            buton_buy:SetFont("LinvFontRobo20")
            buton_buy:SetColor(Color(255, 255, 255))
            buton_buy:SetText(NPCGun.GetTranslation(6))
            buton_buy.Paint = function(self, w, h)
                draw.RoundedBox(4, 0, 0, w, h, Color(113, 113, 113, 255))
                draw.RoundedBox(4, 4, 4, w-8, h-8, Color(55, 55, 55, 255))
            end
            buton_buy.DoClick = function()
                net.Start("NPCGun")
                    net.WriteString("buy")
                    net.WriteString(k)
                net.SendToServer()
                main_frame:Close()
            end
            if AsGunsmith() then
                if LocalPlayer():getDarkRPVar("money") >= (v.price * NPCGun.Config.Multi) then
                    LinvLib.Hover(buton_buy, 4, 4, Color(55, 55, 55, 255), Color(63, 63, 63), Color(113, 113, 113), Color(114, 192, 112))
                else
                    LinvLib.Hover(buton_buy, 4, 4, Color(55, 55, 55, 255), Color(63, 63, 63), Color(113, 113, 113), Color(217, 98, 98))
                end
            else
                if LocalPlayer():getDarkRPVar("money") >= v.price then
                    LinvLib.Hover(buton_buy, 4, 4, Color(55, 55, 55, 255), Color(63, 63, 63), Color(113, 113, 113), Color(114, 192, 112))
                else
                    LinvLib.Hover(buton_buy, 4, 4, Color(55, 55, 55, 255), Color(63, 63, 63), Color(113, 113, 113), Color(217, 98, 98))
                end
            end
        end

        local buton_close = vgui.Create("DButton", main_frame)
        buton_close:SetSize(130, 50)
        buton_close:SetPos(185, 560)
        buton_close:SetFont("LinvFontRobo20")
        buton_close:SetColor(Color(255, 255, 255))
        buton_close:SetText(NPCGun.GetTranslation(5))
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