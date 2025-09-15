-- // GUI TOGGLE SCRIPT PARA DELTA EXECUTOR \\ --
-- Autor: Daviganes3d V and DuduzinOLS

if game.CoreGui:FindFirstChild("c00lkidGui") then
    game.CoreGui.c00lkidGui:Destroy()
end

local TweenService = game:GetService("TweenService")

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
frame.Size = UDim2.new(0, 500, 0, 350)
frame.Position = UDim2.new(0.2, 0, -0.5, 0) -- comeÃ§a fora da tela (em cima)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
frame.BackgroundTransparency = 1
frame.Visible = false

-- Imagem do c00lkidd (fica acima do tÃ­tulo)
local image = Instance.new("ImageLabel")
image.Parent = frame
image.Size = UDim2.new(0.3, 0, 0.3, 0)
image.Position = UDim2.new(0.35, 0, 0.05, 0)
image.BackgroundTransparency = 1
image.Image = "rbxassetid://SEU_ID_DE_IMAGEM_AQUI" -- coloque o ID da sua imagem aqui
image.ScaleType = Enum.ScaleType.Fit

-- TÃ­tulo (logo abaixo da imagem)
local label = Instance.new("TextLabel")
label.Parent = frame
label.Size = UDim2.new(1, 0, 0.1, 0)
label.Position = UDim2.new(0, 0, 0.38, 0)
label.BackgroundTransparency = 1
label.Text = "c00lkid"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold

-- Container para os botÃµes
local container = Instance.new("Frame")
container.Parent = frame
container.Size = UDim2.new(1, -10, 0.55, -10)
container.Position = UDim2.new(0, 5, 0.5, 0)
container.BackgroundTransparency = 1

-- Layout automÃ¡tico em grade
local grid = Instance.new("UIGridLayout")
grid.Parent = container
grid.CellSize = UDim2.new(0.45, 0, 0.2, 0)
grid.CellPadding = UDim2.new(0.05, 0, 0.05, 0)
grid.FillDirectionMaxCells = 2
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.VerticalAlignment = Enum.VerticalAlignment.Top

-- FunÃ§Ãµes para animar fade + slide
local function fadeIn()
    frame.Visible = true
    -- move para posiÃ§Ã£o inicial (fora da tela)
    frame.Position = UDim2.new(0.2, 0, -0.5, 0)
    frame.BackgroundTransparency = 1
    -- anima para dentro da tela
    TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.2, 0, 0, 0),
        BackgroundTransparency = 0.3
    }):Play()
end

local function fadeOut()
    local tween = TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.2, 0, -0.5, 0),
        BackgroundTransparency = 1
    })
    tween:Play()
    tween.Completed:Wait()
    frame.Visible = false
end

-- Toggle abre/fecha
local aberto = false
toggle.MouseButton1Click:Connect(function()
    playClick()
    aberto = not aberto
    if aberto then
        fadeIn()
    else
        fadeOut()
    end
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

-- Criando botÃµes
criarBotao("C00lgui v1 reborn", "https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-48261")
criarBotao("C00lgui deluxe", "https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126")
criarBotao("C00lkid gui", "https://rawscripts.net/raw/Universal-Script-c00lkid-GUI-36102")
criarBotao("tiger x hub", "https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v35-17788")
criarBotao("sans hub", "https://rawscripts.net/raw/Universal-Script-SANS-HUB-16674")
criarBotao("r6 c00lkid", "https://rawscripts.net/raw/Universal-Script-FE-C00lKidd-Forsaken-UNIVERSAL-FOR-R6-44107")
criarBotao("c00lman", "https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126")
criarBotao("brookhaven", "https://rawscripts.net/raw/Universal-Script-Script-Brookhaven-RP-New-50301")