-- // GUI TOGGLE SCRIPT PARA DELTA EXECUTOR \\ --
-- Autor: Davigames3D V e DuduzinOLS

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Apaga caso jÃ¡ exista
if player.PlayerGui:FindFirstChild("c00lkidGui") then
    player.PlayerGui.c00lkidGui:Destroy()
end

-- Criar GUI
local gui = Instance.new("ScreenGui")
gui.Name = "c00lkidGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- NotificaÃ§Ã£o
local function criarNotificacao(titulo, texto, duracao)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0, 350, 0, 40)
    notif.Position = UDim2.new(0.5, -175, 0, -50)
    notif.BackgroundColor3 = Color3.fromRGB(30,30,30)
    notif.TextColor3 = Color3.fromRGB(255,255,255)
    notif.TextScaled = true
    notif.Font = Enum.Font.SourceSansBold
    notif.Text = titulo.." - "..texto
    notif.Parent = gui

    TweenService:Create(notif, TweenInfo.new(0.5), {Position = UDim2.new(0.5,-175,0,20)}):Play()
    task.delay(duracao, function()
        TweenService:Create(notif, TweenInfo.new(0.5), {Position = UDim2.new(0.5,-175,0,-50)}):Play()
        task.wait(0.5)
        notif:Destroy()
    end)
end

-- NotificaÃ§Ãµes iniciais
criarNotificacao("ðŸ… Emblema", "Script executado com sucesso!", 3)
task.delay(0.5, function()
    criarNotificacao("<Bem-vindo ao c00lgui hub>", "<By: Davigames3D V and DuduzinOLS>", 4)
end)

-- Toggle flutuante
local toggle = Instance.new("ImageButton")
toggle.Size = UDim2.new(0, 50, 0, 50)
toggle.Position = UDim2.new(0.05, 0, 0.2, 0)
toggle.BackgroundTransparency = 1
toggle.Image = "rbxassetid://12869420933"
toggle.Active = true
toggle.Draggable = true
toggle.Parent = gui

-- Painel ajustado
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,400,0,300)
frame.Position = UDim2.new(0.25,0,-0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.BackgroundTransparency = 0.2
frame.Visible = false
frame.Parent = gui

-- BotÃ£o fechar
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0,40,0,40)
closeBtn.Position = UDim2.new(1,-45,0,5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)

-- Fundo partÃ­culas
local fundo = Instance.new("Frame", frame)
fundo.Size = UDim2.new(1,0,1,0)
fundo.BackgroundTransparency = 1
fundo.ZIndex = 0

local function criarBolinha()
    local b = Instance.new("Frame")
    b.Size = UDim2.new(0, math.random(5,15), 0, math.random(5,15))
    b.Position = UDim2.new(math.random(),0,1,0)
    b.BackgroundColor3 = Color3.fromRGB(255,255,255)
    b.BackgroundTransparency = 0.5
    b.BorderSizePixel = 0
    b.Parent = fundo
    b.ZIndex = 0

    local function animar()
        local dur = math.random(5,10)
        TweenService:Create(b, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
            Position = UDim2.new(b.Position.X.Scale,0,-0.1,0),
            BackgroundTransparency = 1
        }):Play()

        task.delay(dur, function()
            if b then
                b.Position = UDim2.new(math.random(),0,1,0)
                b.BackgroundTransparency = 0.5
                animar()
            end
        end)
    end
    animar()
end
for i=1,30 do criarBolinha() end

-- Container geral
local container = Instance.new("Frame", frame)
container.Size = UDim2.new(1,-10,0.45,-10)
container.Position = UDim2.new(0,5,0.1,0)
container.BackgroundTransparency = 1
container.ZIndex = 2

local grid = Instance.new("UIGridLayout", container)
grid.CellSize = UDim2.new(0.45,0,0.2,0)
grid.CellPadding = UDim2.new(0.05,0,0.05,0)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.VerticalAlignment = Enum.VerticalAlignment.Top

-- FunÃ§Ã£o botÃ£o estilizado com proteÃ§Ã£o
local function criarBotao(nome, url, parent)
    local btn = Instance.new("TextButton", parent)
    btn.Text = nome
    btn.Size = UDim2.new(0,200,0,50)
    btn.TextScaled = true
    btn.BackgroundColor3 = Color3.fromRGB(255,50,50)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.BorderSizePixel = 2
    btn.BorderColor3 = Color3.fromRGB(255,255,255)
    btn.ZIndex = 2

    -- Efeito hover
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(255,80,80)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(255,50,50)
    end)

    if url and url ~= "" then
        btn.MouseButton1Click:Connect(function()
            local success, err = pcall(function()
                local code = game:HttpGet(url)
                local f = loadstring(code)
                if f then f() end
            end)
            if not success then
                criarNotificacao("Erro", "NÃ£o foi possÃ­vel executar "..nome.."!", 3)
            end
        end)
    end
    return btn
end

-- BotÃµes principais
criarBotao("C00lgui v1 reborn", "https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-48261", container)
criarBotao("C00lgui deluxe", "https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126", container)
criarBotao("C00lkid gui", "https://rawscripts.net/raw/Universal-Script-c00lkid-GUI-36102", container)
criarBotao("Tiger X Hub", "https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v35-17788", container)
criarBotao("Sans Hub", "https://rawscripts.net/raw/Universal-Script-SANS-HUB-16674", container)
criarBotao("R6 C00lkid", "https://rawscripts.net/raw/Universal-Script-FE-C00lKidd-Forsaken-UNIVERSAL-FOR-R6-44107", container)
criarBotao("C00lman", "https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126", container)
criarBotao("Brookhaven", "https://rawscripts.net/raw/Universal-Script-Script-Brookhaven-RP-New-50301", container)

-- Novos botÃµes integrados com cores
-- Coquette Hub (verde)
local coquetteBtn = criarBotao("Coquette Hub", nil, container)
coquetteBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
coquetteBtn.MouseEnter:Connect(function()
    coquetteBtn.BackgroundColor3 = Color3.fromRGB(80, 255, 80)
end)
coquetteBtn.MouseLeave:Connect(function()
    coquetteBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
end)
coquetteBtn.MouseButton1Click:Connect(function()
    loadstring([[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Daivd977/Deivd999/refs/heads/main/pessal"))()
    ]])()
end)

-- Cartola Hub (azul)
local cartolaBtn = criarBotao("Cartola Hub", nil, container)
cartolaBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
cartolaBtn.MouseEnter:Connect(function()
    cartolaBtn.BackgroundColor3 = Color3.fromRGB(80, 180, 255)
end)
cartolaBtn.MouseLeave:Connect(function()
    cartolaBtn.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
end)
cartolaBtn.MouseButton1Click:Connect(function()
    loadstring([[
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
    ]])()
end)

-- K Chaos Hub (roxo)
local chaosBtn = criarBotao("K Chaos Hub", nil, container)
chaosBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 200)
chaosBtn.MouseEnter:Connect(function()
    chaosBtn.BackgroundColor3 = Color3.fromRGB(180, 80, 255)
end)
chaosBtn.MouseLeave:Connect(function()
    chaosBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 200)
end)
chaosBtn.MouseButton1Click:Connect(function()
    loadstring([[
        loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\99\111\110\116\97\116\101\115\116\101\56\47\67\104\97\111\115\72\117\98\86\51\47\114\97\119\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\67\104\97\111\115\72\117\98\86\51\79\98\102\46\116\120\116\34\41\41\40\41")()
    ]])()
end)

-- Links funcionais adicionais
criarBotao("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", container)
criarBotao("Dex Explorer","https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/DexExplorer.lua", container)

-- SeÃ§Ã£o Sky Box
local skyFrame = Instance.new("Frame", frame)
skyFrame.Size = UDim2.new(1,-10,0.2,-10)
skyFrame.Position = UDim2.new(0,5,0.75,0)
skyFrame.BackgroundTransparency = 1
skyFrame.ZIndex = 2

local skyLayout = Instance.new("UIListLayout", skyFrame)
skyLayout.Padding = UDim.new(0,5)
skyLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
skyLayout.VerticalAlignment = Enum.VerticalAlignment.Top

local sky
local skyOnBtn = criarBotao("Ativar Sky Box","", skyFrame)
skyOnBtn.MouseButton1Click:Connect(function()
    local shirt = player.Character and player.Character:FindFirstChildOfClass("Shirt")
    if shirt then
        local id = shirt.ShirtTemplate:match("%d+")
        if id then
            if sky then sky:Destroy() end
            sky = Instance.new("Sky")
            for _,prop in ipairs({"SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp"}) do
                sky[prop] = "rbxassetid://"..id
            end
            sky.Parent = game.Lighting
            criarNotificacao("Sky Box", "Sky Box ativado com a T-Shirt do jogador!", 3)
        else
            criarNotificacao("Erro", "NÃ£o foi possÃ­vel pegar o ID da T-Shirt!", 3)
        end
    else
        criarNotificacao("Aviso", "VocÃª precisa estar usando uma T-Shirt para ativar o Sky Box!", 3)
    end
end)

local skyOffBtn = criarBotao("Remover Sky Box","", skyFrame)
skyOffBtn.MouseButton1Click:Connect(function()
    if sky then
        sky:Destroy()
        sky = nil
        criarNotificacao("Sky Box", "Sky Box removido!", 3)
    end
end)

-- AnimaÃ§Ã£o abrir/fechar
local aberto = false
local function abrir()
    frame.Visible = true
    frame.Position = UDim2.new(0.25,0,-0.3,0)
    TweenService:Create(frame,TweenInfo.new(0.6,Enum.EasingStyle.Quad),{
        Position = UDim2.new(0.25,0,0.15,0)
    }):Play()
end

local function fechar()
    local tween = TweenService:Create(frame,TweenInfo.new(0.6,Enum.EasingStyle.Quad),{
        Position = UDim2.new(0.25,0,-0.3,0)
    })
    tween:Play()
    tween.Completed:Wait()
    frame.Visible = false
end

toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    if aberto then abrir() else fechar() end
end)
closeBtn.MouseButton1Click:Connect(function()
    fechar()
    aberto = false
end)

-- Arrastar painel
local dragging = false
local dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
frame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)