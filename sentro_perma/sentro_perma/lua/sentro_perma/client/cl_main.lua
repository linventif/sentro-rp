surface.CreateFont( "Sentro_Perma_Font_I", {
	font = "Open Sans",
	extended = false,
	size = 22,
})

surface.CreateFont( "Sentro_Perma_Font_III", {
	font = "Open Sans",
	extended = false,
	size = 26,
})

net.Receive("sentro_perma", function()
    local weps = util.JSONToTable(net.ReadString())
    local frame_main = vgui.Create("DFrame")
    frame_main:SetSize(550, 670)
    frame_main:Center()
    frame_main:SetTitle(" ")
    frame_main:MakePopup()
    frame_main:SetDraggable(false)
    frame_main:ShowCloseButton(false)
    frame_main.Paint = function(s, w, h)
        draw.RoundedBox(12, 0, 0, w, h, Sentro_Perma.UI.Border)
        draw.RoundedBox(8, 2, 2, w-4, h-4, Sentro_Perma.UI.Background)
        draw.RoundedBox(12, 25, 25, 500, 50, Sentro_Perma.UI.Border)
        draw.RoundedBox(8, 27, 27, 496, 46, Sentro_Perma.UI.Main)
        draw.SimpleText(Sentro_Perma.Language.Chose_Your_Weapons, "Sentro_Perma_Font_III", 550/2, 50, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local frame_scroll = vgui.Create("DPanel", frame_main)
    frame_scroll:SetPos(25, 100)
    frame_scroll:SetSize(500, 470)
    frame_scroll.Paint = function(s, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(0,0,0,0))
    end

    local wep_scroll = vgui.Create("DScrollPanel", frame_scroll)
    wep_scroll:Dock(FILL)

    local vbar = wep_scroll.VBar
	vbar:SetHideButtons( true )
	function vbar.btnUp:Paint( w, h ) end
	function vbar:Paint( w, h ) end
	function vbar.btnGrip:Paint( w, h ) end

    wep_scroll.VBar:SetHideButtons(true)
	wep_scroll.VBar.Paint = function() end

	wep_scroll.VBar:SetWide(0)
	wep_scroll.VBar.btnUp.Paint = wep_scroll.VBar.Paint
	wep_scroll.VBar.btnDown.Paint = wep_scroll.VBar.Paint
	wep_scroll.VBar.btnGrip.Paint = function(self, w, h) end

    local wep_take = {}
    for wep, b in pairs(weps) do
        local wep_info = {}
        if Sentro_Perma.Config.Weapons[wep] then
            wep_info = Sentro_Perma.Config.Weapons[wep]
        else
            wep_info = {
                ["Name"] = wep,
                ["Icon"] = "materials/sentro_perma/point_of_intero.png"
            }
        end
        local wep_frame = wep_scroll:Add("DPanel")
        wep_frame:SetText(wep)
        wep_frame:SetSize(500, 50)
        wep_frame:Dock(TOP)
        wep_frame:DockMargin(0, 0, 0, 15)
        wep_frame.Paint = function(s, w, h)
            draw.RoundedBox(12, 0, 0, w, h, Color(0, 0, 0, 0))
        end
        local DermaButton = vgui.Create( "DCheckBox", wep_frame )
        DermaButton:SetText("")
        DermaButton:SetImage("materials/sentro_perma/uncheck.png")
        DermaButton:SetSize(50, 50)
        DermaButton.Paint = function(s, w, h)
            draw.RoundedBox(12, 0, 0, w, h, Sentro_Perma.UI.Border)
            draw.RoundedBox(8, 2, 2, w-4, h-4, Sentro_Perma.UI.Main)
        end
        function DermaButton:OnChange(bVal)
            if (bVal) then
                DermaButton:SetImage("materials/sentro_perma/check.png")
                wep_take[wep] = true
            else
                DermaButton:SetImage("materials/sentro_perma/uncheck.png")
                wep_take[wep] = false
            end
        end
        local img_panel = wep_frame:Add("DPanel")
        img_panel:SetSize(100, 50)
        img_panel:SetPos(60, 0)
        img_panel.Paint = function(s, w, h)
            draw.RoundedBox(12, 0, 0, w, h, Sentro_Perma.UI.Border)
            draw.RoundedBox(8, 2, 2, w-4, h-4, Sentro_Perma.UI.Main)
            surface.SetMaterial(Material(wep_info.Icon))
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawTexturedRect(0, 0, 100, 50)
        end
        local txt_panel = wep_frame:Add("DPanel")
        txt_panel:SetSize(330, 50)
        txt_panel:SetPos(170, 0)
        txt_panel.Paint = function(s, w, h)
            draw.RoundedBox(12, 0, 0, w, h, Sentro_Perma.UI.Border)
            draw.RoundedBox(8, 2, 2, w-4, h-4, Sentro_Perma.UI.Main)
            draw.SimpleText(wep_info.Name, "Sentro_Perma_Font_I", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

    local Workshop = vgui.Create("DButton", frame_main)
    Workshop:SetText(Sentro_Perma.Language.Button_Workshop)
    Workshop:SetPos(200, 595)
    Workshop:SetColor(Sentro_Perma.UI.Text)
    Workshop:SetFont("Sentro_Perma_Font_I")
    Workshop:SetSize(150, 50)
    Workshop.DoClick = function()
        gui.OpenURL(Sentro_Perma.Config.Workshop)
    end
    Workshop.Paint = function(s, w, h)
        draw.RoundedBox(12, 0, 0, w, h, Sentro_Perma.UI.Border)
        draw.RoundedBox(10, 2, 2, w-4, h-4, Sentro_Perma.UI.Main)
    end

    local Shop = vgui.Create("DButton", frame_main)
    Shop:SetText(Sentro_Perma.Language.Button_Shop)
    Shop:SetPos(25, 595)
    Shop:SetFont("Sentro_Perma_Font_I")
    Shop:SetColor(Sentro_Perma.UI.Text)
    Shop:SetSize(150, 50)
    Shop.DoClick = function()
        gui.OpenURL(Sentro_Perma.Config.Shop)
    end
    Shop.Paint = function(s, w, h)
        draw.RoundedBox(12, 0, 0, w, h, Sentro_Perma.UI.Border)
        draw.RoundedBox(10, 2, 2, w-4, h-4, Sentro_Perma.UI.Main)
    end

    local Workshop = vgui.Create("DButton", frame_main)
    Workshop:SetText(Sentro_Perma.Language.Button_Workshop)
    Workshop:SetPos(200, 595)
    Workshop:SetColor(Sentro_Perma.UI.Text)
    Workshop:SetFont("Sentro_Perma_Font_I")
    Workshop:SetSize(150, 50)
    Workshop.DoClick = function()
        gui.OpenURL(Sentro_Perma.Config.Workshop)
    end
    Workshop.Paint = function(s, w, h)
        draw.RoundedBox(12, 0, 0, w, h, Sentro_Perma.UI.Border)
        draw.RoundedBox(10, 2, 2, w-4, h-4, Sentro_Perma.UI.Main)
    end

    local Continue = vgui.Create("DButton", frame_main)
    Continue:SetText(Sentro_Perma.Language.Button_Continue)
    Continue:SetPos(375, 595)
    Continue:SetFont("Sentro_Perma_Font_I")
    Continue:SetColor(Sentro_Perma.UI.Text)
    Continue:SetSize(150, 50)
    Continue.DoClick = function()
        if wep_take then
            net.Start("sentro_perma")
            net.WriteString(util.TableToJSON(wep_take))
            net.SendToServer()
        end
        frame_main:Close()
    end
    Continue.Paint = function(s, w, h)
        draw.RoundedBox(12, 0, 0, w, h, Sentro_Perma.UI.Border)
        draw.RoundedBox(10, 2, 2, w-4, h-4, Sentro_Perma.UI.Main)
    end
end)