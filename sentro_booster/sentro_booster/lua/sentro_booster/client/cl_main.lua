local function RespW (w)
    return ScrW() * (w / 1920)
end

local function RespH (h)
    return ScrH() * (h / 1080)
end

local function OpenBooster(data)
    local frame = vgui.Create("DFrame")
    frame:SetSize(RespW(900), RespH(560))
    frame:Center()
    frame:SetTitle("")
    frame:MakePopup()
    frame:ShowCloseButton(false)
    frame:SetDraggable(false)
    frame.Paint = function(self, w, h)
        draw.RoundedBox(12, 0, 0, w, h, Color(113, 113, 113, 255))
        draw.RoundedBox(8, 4, 4, w-8, h-8, Color(58, 58, 58))
        draw.SimpleText("Vous avez ouvert le booster : " .. SBooster.Config.Bosters[data.booster].name, "LinvFontRobo35", w/2, 50, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("maintenant choisissez votre récompense", "LinvFontRobo35", w/2, 90, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    for i = 1, 3 do
        local booster = vgui.Create("DPanel", frame)
        booster:SetSize(RespW(250), RespH(352))
        booster:SetPos(RespW(37.5 + (i-1) * 287.5), RespH(156))
        booster.Paint = function(self, w, h)
            if SBooster.Config.Weapon[data.weps[i]] then
                draw.RoundedBox(8, 0, 0, w, h, SBooster.Config.Weapon[data.weps[i]].color)
                draw.RoundedBox(6, 4, 4, w-8, h-8, Color(80, 80, 80))
                draw.SimpleText(SBooster.Config.Weapon[data.weps[i]].name, "LinvFontRobo35", w/2, 35, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.RoundedBox(8, 0, 0, w, h, Color(113, 113, 113, 255))
                draw.RoundedBox(6, 4, 4, w-8, h-8, Color(80, 80, 80))
                draw.SimpleText(data.weps[i], "LinvFontRobo35", w/2, 42, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
            draw.RoundedBox(8, RespW(20), RespH(66), RespW(210), RespH(210), Color(113, 113, 113))
        end
        local image = SBooster.Config.DefaulImage
        if SBooster.Config.Weapon[data.weps[i]] then
            image = SBooster.Config.Weapon[data.weps[i]].imgur
        end
        local LogoClasse = vgui.Create( "DHTML", booster )
        LogoClasse:SetSize(RespW(190), RespH(190))
        LogoClasse:SetPos(RespW(30), RespH(76))
        LogoClasse:SetMouseInputEnabled(false)
        LogoClasse:SetHTML( "<style> body, html { height: 100%; margin: 0; } .icon { background-image: url(https://i.imgur.com/" .. image .. ".png); height: 100%; background-position: center; background-repeat: no-repeat; background-size: cover; overflow: hidden;} </style> <body> <div class=\"icon\"></div> </body>" )
        local chose = vgui.Create("DButton", booster)
        chose:SetSize(RespW(120), RespH(40))
        chose:SetPos(RespW(65), RespH(292))
        chose:SetText("Choisir")
        chose:SetFont("LinvFontRobo20")
        chose:SetTextColor(Color(255, 255, 255))
        chose.Paint = function(self, w, h)
            draw.RoundedBox(6, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(4, 4, 4, w-8, h-8, Color(80, 80, 80))
        end
        LinvLib.Hover2(chose, 4, 4, 4, Color(80, 80, 80), Color(90, 90, 90), Color(113, 113, 113), Color(113, 113, 113))
        chose.DoClick = function()
            net.Start("SBooster")
                net.WriteString("chose")
                net.WriteString(data.weps[i])
            net.SendToServer()
            frame:Close()
        end
    end
end

local function OpenMenu(data)
    local boosters = {}
    for _, v in pairs(data) do
        if boosters[v.booster] then
            boosters[v.booster] = boosters[v.booster] + 1
        else
            boosters[v.booster] = 1
        end
    end
    -- for booster, amount in pairs(boosters) do
    --     if SBooster.Config.Bosters[booster] then
    --         print(LocalPlayer():Nick() .. " has " .. amount .. " of " .. SBooster.Config.Bosters[booster].name)
    --     else
    --         print(LocalPlayer():Nick() .. " has " .. amount .. " of " .. booster)
    --     end
    -- end

    local booster_menu = vgui.Create("DFrame")
    booster_menu:SetSize(RespW(900), RespH(680))
    booster_menu:Center()
    booster_menu:SetTitle("")
    booster_menu:MakePopup()
    booster_menu:ShowCloseButton(false)
    booster_menu:SetDraggable(false)
    booster_menu.Paint = function(self, w, h)
        draw.RoundedBox(12, 0, 0, w, h, Color(113, 113, 113, 255))
        draw.RoundedBox(8, 4, 4, w-8, h-8, Color(58, 58, 58))
        draw.SimpleText("Sentro Booster", "LinvFontRobo35", w/2, 42, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    local close = vgui.Create("DButton", booster_menu)
    close:SetSize(RespW(30), RespH(30))
    close:SetPos(RespW(900-56), RespH(26))
    close:SetText("")
    local close_mat = Material("linventif-library/icons/close_30px.png")
    close.Paint = function(self, w, h)
        surface.SetDrawColor(255, 255, 255)
        surface.SetMaterial(close_mat)
        surface.DrawTexturedRect(0, 0, w, h)
    end
    close.DoClick = function()
        booster_menu:Close()
    end
    // create a scroll panel with 4 columns
    local dplist = vgui.Create("DPanelList", booster_menu)
    dplist:SetSize(RespW(833+32), RespH(572))
    dplist:SetPos(RespW(32), RespH(82))
    dplist:EnableVerticalScrollbar(true)
    dplist:EnableHorizontal(true)
    dplist:SetSpacing(RespW(32))
    dplist:SetPadding(RespW(0))
    dplist.Paint = function(self, w, h) end
    LinvLib.HideVBar(dplist)
    for k, v in SortedPairs(SBooster.Config.Bosters) do
        local booster = vgui.Create("DPanel")
        local bosst_num = ""
        if boosters[k] then
            bosst_num = " (x" .. boosters[k] .. ")"
        end
        booster:SetSize(RespW(185), RespH(266))
        booster.Paint = function(self, w, h)
            draw.RoundedBox(8, 0, 0, w, h, v.color)
            draw.RoundedBox(6, 4, 4, w-8, h-8, Color(80, 80, 80))
            draw.SimpleText(v.name .. bosst_num, "LinvFontRobo25", w/2, RespH(28), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.RoundedBox(6, 15, 50, RespW(155), RespH(155), Color(113, 113, 113))
        end
        local LogoClasse = vgui.Create( "DHTML", booster )
        LogoClasse:SetSize(RespW(140), RespH(140))
        LogoClasse:SetPos(RespW(22), RespH(57))
        LogoClasse:SetMouseInputEnabled(false)
        LogoClasse:SetHTML( "<style> body, html { height: 100%; margin: 0; } .icon { background-image: url(https://i.imgur.com/" .. (v.imgur || SBooster.Config.DefaulImage) .. ".png); height: 100%; background-position: center; background-repeat: no-repeat; background-size: cover; overflow: hidden;} </style> <body> <div class=\"icon\"></div> </body>" )
        local open = vgui.Create("DButton", booster)
        open:SetSize(RespW(110), RespH(35))
        open:SetPos(RespW(37), RespH(216))
        open:SetFont("LinvFontRobo20")
        open:SetTextColor(Color(255, 255, 255))
        open.Paint = function(self, w, h)
            draw.RoundedBox(6, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(4, 4, 4, w-8, h-8, Color(80, 80, 80))
        end
        LinvLib.Hover2(open, 4, 4, 4, Color(80, 80, 80), Color(95, 95, 95), Color(113, 113, 113), Color(113, 113, 113))
        if !boosters[k] then
            open:SetText("Acheter")
            open.DoClick = function()
                gui.OpenURL(SBooster.Config.URLStore)
            end
        else
            open:SetText("Open")
            open.DoClick = function()
                net.Start("SBooster")
                    net.WriteString("open")
                    net.WriteString(k)
                net.SendToServer()
                booster_menu:Close()
            end
        end
        dplist:AddItem(booster)
    end
end

hook.Add("OnPlayerChat", "SBooster", function(ply, text, team, dead)
    if SBooster.Config.Commands[text] && ply:Alive() && ply == LocalPlayer() then
        net.Start("SBooster")
            net.WriteString("get")
        net.SendToServer()
        net.Receive("SBooster", function(len, ply)
            local id = net.ReadString()
            if id == "get" then
                local data = util.JSONToTable(net.ReadString())
                OpenMenu(data)
            elseif id == "open-pack" then
                print("open")
                local data = util.JSONToTable(net.ReadString())
                OpenBooster(data)
                // OpenBooster({booster = "test", weps = {"weapon_ak47", "weapon_m4a1", "weapon_awp"}})
                //PrintTable(data)
            end
        end)
        return true
    end
end)

concommand.Add("sbooster_chosen_reward", function(ply, cmd, args)
    net.Start("SBooster")
        net.WriteString("chose")
        net.WriteString(args[1])
    net.SendToServer()
end)

concommand.Add("sbooster_open", function(ply, cmd, args)
    net.Start("SBooster")
        net.WriteString("open")
        net.WriteString(args[1])
    net.SendToServer()
end)

concommand.Add("sbooster_get", function(ply, cmd, args)
    net.Start("SBooster")
        net.WriteString("get")
    net.SendToServer()
end)