local config = {
    ["discord_url"] = "https://google.fr",
    ["workshop_url"] = "https://google.fr",
    ["shop_url"] = "https://google.fr",
}
// hook.Run("Sentro:PlyReady")
local whitelist_char = {
    ["a"] = true,
    ["b"] = true,
    ["c"] = true,
    ["d"] = true,
    ["e"] = true,
    ["f"] = true,
    ["g"] = true,
    ["h"] = true,
    ["i"] = true,
    ["j"] = true,
    ["k"] = true,
    ["l"] = true,
    ["m"] = true,
    ["n"] = true,
    ["o"] = true,
    ["p"] = true,
    ["q"] = true,
    ["r"] = true,
    ["s"] = true,
    ["t"] = true,
    ["u"] = true,
    ["v"] = true,
    ["w"] = true,
    ["x"] = true,
    ["y"] = true,
    ["z"] = true
}

local function IsCharWhitelisted(char)
    return whitelist_char[char]
end

local function verif_string(str)
    for i = 1, string.len(str) do
        local char = str[i]
        if not IsCharWhitelisted(char) then
            return false
        end
    end
    return true
end

surface.CreateFont("StartMenuFont44", {
	font = "Arial",
	size = 44,
	weight = 1000,
})

surface.CreateFont("StartMenuFont75", {
	font = "Arial",
	size = 75,
	weight = 1000,
})

surface.CreateFont("StartMenuFont85", {
	font = "Arial",
	size = 85,
	weight = 1000,
})

surface.CreateFont("StartMenuFont140", {
	font = "Arial",
	size = 140,
	weight = 1000,
})
surface.CreateFont("StartMenuFont24", {
	font = "Arial",
	size = 28,
	weight = 500,
})

local function RespW (w)
    return ScrW() * (w / 1920)
end

local function RespH (h)
    return ScrH() * (h / 1080)
end

local data = {
    ["version"] = "0.1.0",
    ["start"] = false
}

if file.Exists("sentro/info.json", "DATA") then
    local save_data = util.JSONToTable(file.Read("sentro/info.json", "DATA"))
    local version = data.version
    if save_data.version < version then
        table.Merge(data, save_data)
        data.version = version
        file.Write("sentro/info.json", util.TableToJSON(data))
    else
        data = save_data
    end
else
    file.CreateDir("sentro")
    file.Write("sentro/info.json", util.TableToJSON(data))
end

local function OpenStartMenu(id)
    hook.Add("HUDPaint", "linv_test_hud", function()
        return false
    end)
    local welcome_menu = vgui.Create("DFrame")
    welcome_menu:SetSize(ScrW(), ScrH())
    welcome_menu:Center()
    welcome_menu:MakePopup()
    welcome_menu:SetTitle("")
    welcome_menu:SetDraggable(false)
    welcome_menu:ShowCloseButton(false)
    welcome_menu:GetBackgroundBlur(true)
    if id == 1 then
        welcome_menu.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 40))
            Derma_DrawBackgroundBlur(self, self.m_fCreateTime)
            draw.SimpleText("Bienvenue sur", "StartMenuFont85", RespW(960), RespH(200), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("SentroRP - DarkRP", "StartMenuFont140", RespW(960), RespH(320), Color(30, 30, 30), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        local buton_start = vgui.Create("DButton", welcome_menu)
        buton_start:SetSize(RespW(500), RespH(130))
        buton_start:SetPos(RespW(710), RespH(750))
        buton_start:SetFont("StartMenuFont75")
        buton_start:SetColor(Color(255, 255, 255))
        if data.start == true then
            buton_start:SetText("Continuer")
        else
            buton_start:SetText("Commencer")
        end
        buton_start.Paint = function(self, w, h)
            draw.RoundedBox(14, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(8, 6, 6, w-12, h-12, Color(51, 51, 51, 255))
        end
        buton_start.DoClick = function()
            if data.start == true then
                welcome_menu:Close()
                hook.Remove("HUDPaint", "linv_test_hud")
                hook.Run("Sentro:PlyReady")
                net.Start("Sentro:Start")
                net.SendToServer()
            else
                welcome_menu:Close()
                hook.Remove("HUDPaint", "linv_test_hud")
                RunConsoleCommand("sentro_start_name")
            end
        end
        LinvLib.Hover(buton_start, 8, 6, Color(51, 51, 51, 255), Color(63, 63, 63), Color(113, 113, 113), Color(113, 113, 113))
        local buton_shop = vgui.Create("DButton", welcome_menu)
        buton_shop:SetSize(RespW(300), RespH(80))
        buton_shop:SetPos(RespW(480), RespH(910))
        buton_shop:SetFont("StartMenuFont44")
        buton_shop:SetColor(Color(255, 255, 255))
        buton_shop:SetText("Boutique")
        buton_shop.DoClick = function()
            gui.OpenURL(config.shop_url)
        end
        buton_shop.Paint = function(self, w, h)
            draw.RoundedBox(14, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(8, 6, 6, w-12, h-12, Color(51, 51, 51, 255))
        end
        LinvLib.Hover(buton_shop, 8, 6, Color(51, 51, 51, 255), Color(63, 63, 63), Color(113, 113, 113), Color(113, 113, 113))
        local buton_workshop = vgui.Create("DButton", welcome_menu)
        buton_workshop:SetSize(RespW(300), RespH(80))
        buton_workshop:SetPos(RespW(810), RespH(910))
        buton_workshop:SetFont("StartMenuFont44")
        buton_workshop:SetColor(Color(255, 255, 255))
        buton_workshop:SetText("Collection")
        buton_workshop.DoClick = function()
            gui.OpenURL(config.workshop_url)
        end
        buton_workshop.Paint = function(self, w, h)
            draw.RoundedBox(14, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(8, 6, 6, w-12, h-12, Color(51, 51, 51, 255))
        end
        LinvLib.Hover(buton_workshop, 8, 6, Color(51, 51, 51, 255), Color(63, 63, 63), Color(113, 113, 113), Color(113, 113, 113))
        local buton_discord = vgui.Create("DButton", welcome_menu)
        buton_discord:SetSize(RespW(300), RespH(80))
        buton_discord:SetPos(RespW(1140), RespH(910))
        buton_discord:SetText("Discord")
        buton_discord:SetFont("StartMenuFont44")
        buton_discord:SetColor(Color(255, 255, 255))
        buton_discord.DoClick = function()
            gui.OpenURL(config.discord_url)
        end
        buton_discord.Paint = function(self, w, h)
            draw.RoundedBox(14, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(8, 6, 6, w-12, h-12, Color(51, 51, 51, 255))
        end
        LinvLib.Hover(buton_discord, 8, 6, Color(51, 51, 51, 255), Color(63, 63, 63), Color(113, 113, 113), Color(113, 113, 113))
    else
        welcome_menu.Paint = function(self, w, h)
            draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255, 40))
            Derma_DrawBackgroundBlur(self, self.m_fCreateTime)
        end
        local name_menu = vgui.Create("DPanel", welcome_menu)
        name_menu:SetSize(RespW(650), RespH(650))
        name_menu:SetPos(RespW(ScrW()/2-275), RespH(ScrH()/2-275))
        name_menu.Paint = function(self, w, h)
            draw.RoundedBox(6, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            draw.SimpleText("Vous devez choisir un", "StartMenuFont44", w/2, RespH(75), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Nom et Prénom Rôle-Play", "StartMenuFont44", w/2, RespH(125), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        local buton_start = vgui.Create("DButton", name_menu)
        buton_start:SetSize(RespW(300), RespH(100))
        buton_start:SetPos(RespW(175), RespH(510))
        buton_start:SetFont("StartMenuFont44")
        buton_start:SetColor(Color(255, 255, 255))
        buton_start:SetText("Continuer")
        buton_start.Paint = function(self, w, h)
            draw.RoundedBox(6, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
        end
        LinvLib.Hover(buton_start, 6, 4, Color(51, 51, 51, 255), Color(63, 63, 63), Color(113, 113, 113), Color(113, 113, 113))
        local last_name_entry = vgui.Create("DTextEntry", name_menu)
        last_name_entry:SetSize(RespW(600), RespH(100))
        last_name_entry:SetPos(RespW(25), RespH(200))
        last_name_entry:SetFont("StartMenuFont44")
        last_name_entry:SetTextColor(Color(255, 255, 255))
        last_name_entry:SetPlaceholderText("Nom")
        last_name_entry.Paint = function(self, w, h)
            draw.RoundedBox(6, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            if self:GetText() == "" then
                draw.SimpleText("Nom", "StartMenuFont44", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            elseif (string.len(self:GetText()) < 4) || (string.len(self:GetText()) > 14) || (!verif_string(self:GetText())) then
                draw.RoundedBox(6, 0, 0, w, h, Color(194, 108, 108))
                draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            else
                draw.RoundedBox(6, 0, 0, w, h, Color(114, 192, 112))
                draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            end
            self:DrawTextEntryText(Color(255, 255, 255), Color(88, 88, 88), Color(255, 255, 255))
        end
        local first_name_entry = vgui.Create("DTextEntry", name_menu)
        first_name_entry:SetSize(RespW(600), RespH(100))
        first_name_entry:SetPos(RespW(25), RespH(350))
        first_name_entry:SetFont("StartMenuFont44")
        first_name_entry:SetTextColor(Color(255, 255, 255))
        first_name_entry:SetPlaceholderText("Prénom")
        first_name_entry.Paint = function(self, w, h)
            draw.RoundedBox(6, 0, 0, w, h, Color(113, 113, 113))
            draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            if self:GetText() == "" then
                draw.SimpleText("Prénom", "StartMenuFont44", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            elseif (string.len(self:GetText()) < 4) || (string.len(self:GetText()) > 14) || (!verif_string(self:GetText())) then
                draw.RoundedBox(6, 0, 0, w, h, Color(194, 108, 108))
                draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            else
                draw.RoundedBox(6, 0, 0, w, h, Color(114, 192, 112))
                draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
            end
            self:DrawTextEntryText(Color(255, 255, 255), Color(88, 88, 88), Color(255, 255, 255))
        end
        local buton_cooldown = false
        buton_start.DoClick = function()
            if ((string.len(last_name_entry:GetText()) >= 4) && (string.len(last_name_entry:GetText()) <= 14)) &&
            ((string.len(first_name_entry:GetText()) >= 4) && (string.len(first_name_entry:GetText()) <= 14)) &&
            verif_string(last_name_entry:GetText()) && verif_string(first_name_entry:GetText()) && !buton_cooldown then
                welcome_menu:Close()
                hook.Remove("HUDPaint", "linv_test_hud")
                hook.Run("Sentro:PlyReady")
                local first_name = first_name_entry:GetText()
                first_name = string.upper(string.sub(first_name, 1, 1)) .. string.sub(first_name, 2)
                local last_name = last_name_entry:GetText()
                last_name = string.upper(string.sub(last_name, 1, 1)) .. string.sub(last_name, 2)
                RunConsoleCommand("say", "/name " .. first_name .. " " .. last_name)
                net.Start("Sentro:Start")
                net.SendToServer()
                data.start = true
                file.Write("sentro/info.json", util.TableToJSON(data))
            elseif !buton_cooldown then
                buton_cooldown = true
                local notif_panel = vgui.Create("DPanel", welcome_menu)
                notif_panel:SetSize(RespW(650), RespH(100))
                notif_panel:SetPos(RespW(ScrW()/2-275), RespH(-100))
                notif_panel:MoveTo(RespW(ScrW()/2-275), 50, 0.75, 0, 1)
                notif_panel.Paint = function(self, w, h)
                    draw.RoundedBox(6, 0, 0, w, h, Color(113, 113, 113))
                    draw.RoundedBox(6, 4, 4, w-8, h-8, Color(51, 51, 51, 255))
                    draw.SimpleText("Lettre en minuscule uniquement et minimum 4 !", "StartMenuFont24", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                timer.Simple(4, function()
                    if not notif_panel then return end
                    notif_panel:MoveTo(RespW(ScrW()/2-275), -150, 0.75, 0, 1)
                    timer.Simple(0.75, function()
                        if not notif_panel then return end
                        notif_panel:Remove()
                        buton_cooldown = false
                    end)
                end)
            end
        end

    end
end

concommand.Add("sentro_start", function(ply, cmd, args)
    OpenStartMenu(1)
end)

concommand.Add("sentro_start_name", function(ply, cmd, args)
    OpenStartMenu(2)
end)

concommand.Add("sentro_get_pos", function(ply, cmd, args)
    print(ply:GetPos())
    print(ply:GetAngles())
end)

hook.Add("InitPostEntity", "sentro_start_menu", function()
    timer.Simple(1, function()
        OpenStartMenu(1)
    end)
end)