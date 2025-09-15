-- // GUI TOGGLE SCRIPT PARA DELTA EXECUTOR \\ --
-- Autor: Davidgames3d V 

if game.CoreGui:FindFirstChild("c00lkidGui") then
    game.CoreGui.c00lkidGui:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "c00lkidGui"
gui.Parent = game.CoreGui

local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://18755588842"
clickSound.Volume = 1
clickSound.Parent = gui

local function playClick()
    clickSound:Play()
end

-- BotÃ£o flutuante
local toggle = Instance.new("ImageButton")
toggle.Name = "ToggleButton"
toggle.Parent = gui
toggle.Size = UDim2.new(0, 50, 0, 50)
toggle.Position = UDim2.new(0.05, 0, 0.2, 0)
toggle.BackgroundTransparency = 1
toggle.Image = "rbxassetid://12869420933"
toggle.Active = true
toggle.Draggable = true

-- Janela
local frame = Instance.new("Frame")
frame.Name = "MiniJanela"
frame.Parent = gui
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.2, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
frame.BackgroundTransparency = 0.3
frame.Visible = false

-- TÃ­tulo
local label = Instance.new("TextLabel")
label.Parent = frame
label.Size = UDim2.new(1, 0, 0.15, 0)
label.BackgroundTransparency = 1
label.Text = "c00lkid"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold

-- Container para os botÃµes
local container = Instance.new("Frame")
container.Parent = frame
container.Size = UDim2.new(1, -10, 0.8, -10)
container.Position = UDim2.new(0, 5, 0.18, 0)
container.BackgroundTransparency = 1

-- Layout automÃ¡tico em grade
local grid = Instance.new("UIGridLayout")
grid.Parent = container
grid.CellSize = UDim2.new(0.45, 0, 0.2, 0) -- largura e altura dos botÃµes
grid.CellPadding = UDim2.new(0.05, 0, 0.05, 0) -- espaÃ§amento entre os botÃµes
grid.FillDirectionMaxCells = 2 -- 2 colunas
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.VerticalAlignment = Enum.VerticalAlignment.Top

-- Toggle abre/fecha
local aberto = false
toggle.MouseButton1Click:Connect(function()
    playClick()
    aberto = not aberto
    frame.Visible = aberto
end)

-- FunÃ§Ã£o criar botÃµes
local function criarBotao(nome, scriptUrl)
    local btn = Instance.new("TextButton")
    btn.Parent = container
    btn.Size = UDim2.new(0, 200, 0, 50)
    btn.Text = nome
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSans
    btn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

    btn.MouseButton1Click:Connect(function()
        playClick()
        print("BotÃ£o "..nome.." clicado! Executando aÃ§Ã£o...")
        loadstring(game:HttpGet(scriptUrl))()
    end)
end

-- Criando botÃµes organizados automaticamente
criarBotao("C00lgui v1 reborn", "https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-48261")
criarBotao("C00lgui deluxe", "https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126")
criarBotao("C00lkid gui", "https://rawscripts.net/raw/Universal-Script-c00lkid-GUI-36102")
criarBotao("tiger x hub", "https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v35-17788")
criarBotao("sans hub", "https://rawscripts.net/raw/Universal-Script-SANS-HUB-16674")
criarBotao("r6 c00lkid", "https://rawscripts.net/raw/Universal-Script-FE-C00lKidd-Forsaken-UNIVERSAL-FOR-R6-44107")
criarBotao("c00lman", "https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126")
criarBotao("brookhaven", "https://rawscripts.net/raw/Universal-Script-Script-Brookhaven-RP-New-50301")