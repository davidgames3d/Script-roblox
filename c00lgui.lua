-- // GUI TOGGLE SCRIPT PARA DELTA EXECUTOR \\ --
-- Autor: Davidgames3d V 

-- Verifica se já existe a GUI para evitar duplicação
if game.CoreGui:FindFirstChild("c00lkidGui") then
    game.CoreGui.c00lkidGui:Destroy()
end

-- Criar ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "c00lkidGui"
gui.Parent = game.CoreGui

-- Criar som único para todos os botões
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://18755588842"
clickSound.Volume = 1
clickSound.Parent = gui

local function playClick()
    clickSound:Play()
end

-- Criar botão flutuante (toggle)
local toggle = Instance.new("ImageButton")
toggle.Name = "ToggleButton"
toggle.Parent = gui
toggle.Size = UDim2.new(0, 50, 0, 50)
toggle.Position = UDim2.new(0.05, 0, 0.2, 0) -- posição na tela
toggle.BackgroundTransparency = 1
toggle.Image = "rbxassetid://12869420933"
toggle.Active = true
toggle.Draggable = true

-- Criar mini janela (quadrado vermelho transparente)
local frame = Instance.new("Frame")
frame.Name = "MiniJanela"
frame.Parent = gui
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.2, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
frame.BackgroundTransparency = 0.3
frame.Visible = false

-- Texto "c00lkid"
local label = Instance.new("TextLabel")
label.Parent = frame
label.Size = UDim2.new(1, 0, 0.3, 0)
label.Position = UDim2.new(0, 0, 0, 0)
label.BackgroundTransparency = 1
label.Text = "c00lkid"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold

-- Função toggle
local aberto = false
toggle.MouseButton1Click:Connect(function()
    playClick()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Função utilitária para criar botões internos
local function criarBotao(nome, pos, scriptUrl)
    local btn = Instance.new("TextButton")
    btn.Parent = frame
    btn.Size = UDim2.new(0.3, 0, 0.1, 0)
    btn.Position = pos
    btn.Text = nome
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSans
    btn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

    btn.MouseButton1Click:Connect(function()
        playClick()
        print("Botão "..nome.." clicado! Executando ação...")
        loadstring(game:HttpGet(scriptUrl))()
    end)
end

-- Criar os botões internos
criarBotao("C00lgui v1 reborn", UDim2.new(0.0, 0, 0.3, 0), "https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-48261")
criarBotao("C00lgui deluxe", UDim2.new(0.0, 0, 0.5, 0), "https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126")
criarBotao("C00lkid gui", UDim2.new(0.0, 0, 0.8, 0), "https://rawscripts.net/raw/Universal-Script-c00lkid-GUI-36102")
criarBotao("tiger x hub", UDim2.new(0.6, 0, 0.5, 0), "https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v35-17788")
criarBotao("sans hub", UDim2.new(0.29, 0, 0.5, 0), "https://rawscripts.net/raw/Universal-Script-SANS-HUB-16674")
criarBotao("r6 c00lkid", UDim2.new(0.29, 0, 0.9, 0), "https://rawscripts.net/raw/Universal-Script-FE-C00lKidd-Forsaken-UNIVERSAL-FOR-R6-44107")
criarBotao("c00lman", UDim2.new(0.29, 0, 0.7, 0), "https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126")
criarBotao("brookhaven", UDim2.new(0.29, 0, 0.8, 0), "https://rawscripts.net/raw/Universal-Script-Script-Brookhaven-RP-New-50301")