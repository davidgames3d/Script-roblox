local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Corrupted Code Hub🇧🇷", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "CONFIRA MEU CANAL YT",
	Content = "CRIADO POR DAVIDGAMES3D",
	Image = "rbxassetid://123248224635618",
	Time = 5
})

local Tab = Window:MakeTab({
	Name = "INÍCIO",
	Icon = "rbxassetid://128706247346129",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "DARK HUB🐺",
	Callback = function()      		loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DARKHUB%F0%9F%90%BA.lua"))()
  	end    
})

Tab:AddButton({
	Name = "BLACK HUB⚫",
	Callback = function()    		loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/BLACKHUB%E2%9A%AB%F0%9F%8C%98.lua"))()
  	end    
})

Tab:AddButton({
	Name = "Xester GUU",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/xester%20v2%20script%20my%20version.lua"))()
  	end    
})

Tab:AddButton({
	Name = "E.X.E C00QUETTE",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/E.X.E%20COQUETTE.lua"))()
  	end    
})

-- Definindo o slider para Velocidade (WalkSpeed)
Tab:AddSlider({
    Name = "Velocidade",
    Min = 16, -- Velocidade mínima (padrão do Roblox)
    Max = 100, -- Velocidade máxima
    Default = 16, -- Velocidade padrão
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1, -- Incremento de 1 unidade
    ValueName = "unidades",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
            print("Velocidade alterada para: " .. Value)
        end
    end
})

-- Definindo o slider para Pulo (JumpPower)
Tab:AddSlider({
    Name = "Força do Pulo",
    Min = 50, -- Força de pulo mínima (padrão do Roblox)
    Max = 200, -- Força de pulo máxima
    Default = 50, -- Força de pulo padrão
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1, -- Incremento de 1 unidade
    ValueName = "unidades",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = Value
            print("Força do pulo alterada para: " .. Value)
        end
    end
})

local Tab = Window:MakeTab({
	Name = "Troll",
	Icon = "rbxassetid://6862780932",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "C00lkidd v2 gui",
	Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/14EU4i8n",true))()
  	end    
})

Tab:AddButton({
	Name = "KaterHub troll gui",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KATERGaming/Roblox/main/KaterHub.Lua"))()
  	end    
})

Tab:AddButton({
	Name = "MoonUI V10 TROLL",
	Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/IlikeyocutgHAH12/MoonUI-v10-/main/MoonUI%20v10'))()
  	end    
})

Tab:AddButton({
	Name = "System Broken",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
  	end    
}) 

Tab:AddButton({
	Name = "trolling Gui life In paridise",
	Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Life-in-Paradise-trolling-gui-64351"))()
  	end    
})

Tab:AddButton({
	Name = "brookhaven troll!",
	Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Brookhaven-Best-Troll-Script-64024"))()
  	end    
})

Tab:AddButton({
	Name = "ban orbitX",
	Callback = function()	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fake-Ban-Made-by-OrbitX-43820"))()
  	end    
})