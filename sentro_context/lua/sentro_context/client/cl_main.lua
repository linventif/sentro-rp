local function RespW(x)
    return ScrW() / 1920 * x
end

local function RespH(y)
    return ScrH() / 1080 * y
end

local function NumberMenu(msg)
    local frame = vgui.Create("DFrame")
    frame:SetSize(RespW(400), RespH(290))
    frame:Center()
    frame:SetTitle("")
    frame:MakePopup()
    frame:ShowCloseButton(false)
    frame:SetDraggable(false)
    frame.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, SentroContext.Config.Color["border"])
        draw.RoundedBox(6, RespW(4), RespH(4), w-RespW(8), h-RespH(8), SentroContext.Config.Color["background"])
        if #msg > 1 then
            draw.SimpleText(msg[1], "LinvFontRobo25", w/2, RespH(40), SentroContext.Config.Color["text"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(msg[2], "LinvFontRobo25", w/2, RespH(80), SentroContext.Config.Color["text"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(msg[1], "LinvFontRobo25", w/2, RespH(60), SentroContext.Config.Color["text"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    local txtentr_value = vgui.Create("DTextEntry", frame)
    txtentr_value:SetNumeric(true)
    txtentr_value:SetSize(RespW(320), RespH(50))
    txtentr_value:SetPos(RespW(40), RespH(120))
    txtentr_value:SetFont("LinvFontRobo20")
    txtentr_value:SetTextColor(SentroContext.Config.Color["text"])
    txtentr_value.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, SentroContext.Config.Color["border"])
        draw.RoundedBox(6, RespW(3), RespH(3), w-RespW(6), h-RespH(6), SentroContext.Config.Color["background"])
        if self:GetText() == "" then
            draw.SimpleText(SentroContext.GetTranslation("number_only"), "LinvFontRobo20", w/2, h/2, SentroContext.Config.Color["text"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        elseif tonumber(self:GetText()) > LocalPlayer():getDarkRPVar("money") then
            draw.RoundedBox(8, 0, 0, w, h, SentroContext.Config.Color["red"])
            draw.RoundedBox(6, RespW(3), RespH(3), w-RespW(6), h-RespH(6), SentroContext.Config.Color["background"])
        else
            draw.RoundedBox(8, 0, 0, w, h, SentroContext.Config.Color["green"])
            draw.RoundedBox(6, RespW(3), RespH(3), w-RespW(6), h-RespH(6), SentroContext.Config.Color["background"])
        end
        self:DrawTextEntryText(SentroContext.Config.Color["text"], SentroContext.Config.Color["background"], SentroContext.Config.Color["text"])
    end
    local but_close = vgui.Create("DButton", frame)
    but_close:SetSize(RespW(140), RespH(40))
    but_close:SetPos(RespW(40), RespH(210))
    but_close:SetText(SentroContext.GetTranslation("close"))
    but_close:SetFont("LinvFontRobo20")
    but_close:SetTextColor(SentroContext.Config.Color["text"])
    but_close.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, SentroContext.Config.Color["border"])
        draw.RoundedBox(6, RespW(3), RespH(3), w-RespW(6), h-RespH(6), SentroContext.Config.Color["background"])
    end
    LinvLib.Hover2(but_close, 8, 6, 3, SentroContext.Config.Color["background"], SentroContext.Config.Color["hover"], SentroContext.Config.Color["border"], SentroContext.Config.Color["border"])
    but_close.DoClick = function()
        frame:Close()
    end
    local but_continue = vgui.Create("DButton", frame)
    but_continue:SetSize(RespW(140), RespH(40))
    but_continue:SetPos(RespW(220), RespH(210))
    but_continue:SetText(SentroContext.GetTranslation("continue"))
    but_continue:SetFont("LinvFontRobo20")
    but_continue:SetTextColor(SentroContext.Config.Color["text"])
    but_continue.Paint = function(self, w, h)
        draw.RoundedBox(8, 0, 0, w, h, SentroContext.Config.Color["border"])
        draw.RoundedBox(6, RespW(3), RespH(3), w-RespW(6), h-RespH(6), SentroContext.Config.Color["background"])
    end
    LinvLib.Hover2(but_continue, 8, 6, 3, SentroContext.Config.Color["background"], SentroContext.Config.Color["hover"], SentroContext.Config.Color["border"], SentroContext.Config.Color["border"])
    but_continue.DoClick = function()
        frame:Close()
        return tonumber(txtentr_value:GetText())
    end
end

hook.Add("OnContextMenuOpen", "BlockContextMenu", function()
    local frame = vgui.Create("DFrame")
    frame:SetSize(RespW(500), ScrH())
    frame:SetPos(RespW(ScrW()-500), 0)
    frame:SetTitle("")
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)
    frame:MakePopup()
    frame.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, SentroContext.Config.Color["background"])
        draw.RoundedBox(0, 0, 0, 4, h, SentroContext.Config.Color["border"])
        draw.SimpleText("SentroRP - DarkRP", "LinvFontRobo50", 250, 306, SentroContext.Config.Color["text"], TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    local LogoSentro = vgui.Create("DHTML", frame)
    LogoSentro:SetSize(RespW(400), RespH(250))
    LogoSentro:SetPos(RespW(50), RespH(20))
    LogoSentro:SetMouseInputEnabled(false)
    LogoSentro:SetHTML( "<style> body, html { height: 100%; margin: 0; } .icon { background-image: url(https://i.imgur.com/hWgKSl9.png); height: 100%; background-position: center; background-repeat: no-repeat; background-size: cover; overflow: hidden;} </style> <body> <div class=\"icon\"></div> </body>" )
    local scroll_content = vgui.Create("DScrollPanel", frame)
    scroll_content:SetSize(RespW(500), RespH(700))
    scroll_content:SetPos(RespW(0), RespH(380))
    scroll_content.VBar:SetHideButtons(true)
    scroll_content.VBar.Paint = function()
        draw.RoundedBox(0, 0, 0, 10, scroll_content.VBar:GetTall(), SentroContext.Config.Color["background"])
    end
    scroll_content.VBar:SetWide(4)
    scroll_content.VBar.btnGrip.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, SentroContext.Config.Color["inter"])
    end
    for k, v in SortedPairs(SentroContext.Config.Content) do
        if v.admin and not SentroContext.Config.Admin[LocalPlayer():GetUserGroup()] then continue end
        local category = vgui.Create("DLabel", scroll_content)
        category:SetSize(RespW(500), RespH(60))
        category:SetPos(RespW(0), RespH(0))
        category:SetText(v.name)
        category:SetContentAlignment(5)
        category:SetFont("LinvFontRobo30")
        category:SetTextColor(SentroContext.Config.Color["text"])
        category:Dock(TOP)
        category:DockMargin(0, 0, 0, 0)
        category.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, SentroContext.Config.Color["border"])
        end
        local dplist = vgui.Create("DPanelList", scroll_content)
        dplist:SetSize(RespW(500), RespH(35+(math.Round(#v.buttons/2)*85)))
        dplist:SetPos(RespW(0), RespH(0))
        dplist:EnableVerticalScrollbar(true)
        dplist:EnableHorizontal(true)
        dplist:SetSpacing(RespW(35))
        dplist:SetPadding(RespW(35))
        dplist:Dock(TOP)
        dplist:DockMargin(0, 0, 0, 0)
        dplist.Paint = function(self, w, h) end
        LinvLib.HideVBar(dplist)
        for k, v in SortedPairs(v.buttons) do
            local button = vgui.Create("DButton", dplist)
            button:SetSize(RespW(200), RespH(50))
            button:SetText(v.name)
            button:SetFont("LinvFontRobo20")
            button:SetTextColor(SentroContext.Config.Color["text"])
            button.Paint = function(self, w, h)
                draw.RoundedBox(8, 0, 0, w, h, SentroContext.Config.Color["border"])
                draw.RoundedBox(6, RespW(4), RespH(4), w-RespW(8), h-RespH(8), SentroContext.Config.Color["background"])
            end
            button.DoClick = function()
                if v.command then
                    RunConsoleCommand(v.command)
                elseif v.func then
                    v.func()
                elseif v.chat then
                    RunConsoleCommand("say", v.chat)
                elseif v.url then
                    gui.OpenURL(v.url)
                elseif v.special then
                    if v.special == "dropmoney" then
                        NumberMenu({SentroContext.GetTranslation("dropmoney")})
                    end
                end
            end
            LinvLib.Hover2(button, 8, 6, 4, SentroContext.Config.Color["background"], SentroContext.Config.Color["hover"], SentroContext.Config.Color["border"], SentroContext.Config.Color["border"])
            dplist:AddItem(button)
        end
    end
    hook.Add("OnContextMenuClose", "CloseContextMenu", function()
        frame:Close()
    end)
    return false
end)