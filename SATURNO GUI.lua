-- // GUI TOGGLE SCRIPT PARA DELTA EXECUTOR \\ --
-- Autor: Davigames3D V e DuduzinOLS

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Apaga caso jÃ¡ exista
if player.PlayerGui:FindFirstChild("SaturnoGui") then
    player.PlayerGui.SaturnoGui:Destroy()
end

-- Criar GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SaturnoGui"
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
    criarNotificacao("<Bem-vindo ao SaturnoGui ðŸª>", "<By: Davigames3D V and DuduzinOLS>", 4)
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

-- Painel futurista
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,420,0,320)
frame.Position = UDim2.new(0.25,0,-0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,40)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = gui
frame.ZIndex = 2
frame.ClipsDescendants = true

-- Bordas arredondadas
local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0,15)

-- Sombra leve
local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1,10,1,10)
shadow.Position = UDim2.new(0,-5,0,-5)
shadow.Image = "rbxassetid://7035078620"
shadow.BackgroundTransparency = 1
shadow.ZIndex = 1
shadow.Parent = frame

-- Fundo partÃ­culas
local fundo = Instance.new("Frame", frame)
fundo.Size = UDim2.new(1,0,1,0)
fundo.BackgroundTransparency = 1
fundo.ZIndex = 0

local function criarBolinha()
    local b = Instance.new("Frame")
    b.Size = UDim2.new(0, math.random(3,10), 0, math.random(3,10))
    b.Position = UDim2.new(math.random(),0,1,0)
    b.BackgroundColor3 = Color3.fromRGB(255,255,255)
    b.BackgroundTransparency = 0.6
    b.BorderSizePixel = 0
    b.ZIndex = 0
    b.Parent = fundo

    local function animar()
        local dur = math.random(6,12)
        TweenService:Create(b, TweenInfo.new(dur, Enum.EasingStyle.Linear), {
            Position = UDim2.new(b.Position.X.Scale,0,-0.1,0),
            BackgroundTransparency = 1
        }):Play()
        task.delay(dur, function()
            if b then
                b.Position = UDim2.new(math.random(),0,1,0)
                b.BackgroundTransparency = 0.6
                animar()
            end
        end)
    end
    animar()
end
for i=1,20 do criarBolinha() end

-- Container de botÃµes
local container = Instance.new("Frame", frame)
container.Size = UDim2.new(1,-20,0.45,-10)
container.Position = UDim2.new(0,10,0.1,0)
container.BackgroundTransparency = 1
container.ZIndex = 2

local grid = Instance.new("UIGridLayout", container)
grid.CellSize = UDim2.new(0.45,0,0.18,0)
grid.CellPadding = UDim2.new(0.05,0,0.05,0)
grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
grid.VerticalAlignment = Enum.VerticalAlignment.Top

-- FunÃ§Ã£o criar botÃµes futurista
local function criarBotao(nome, url, parent, cor)
    local btn = Instance.new("TextButton", parent)
    btn.Text = nome
    btn.Size = UDim2.new(0,200,0,45)
    btn.TextScaled = true
    btn.BackgroundColor3 = cor or Color3.fromRGB(255,50,50)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.BorderSizePixel = 0
    btn.ZIndex = 2

    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0,10)

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = btn.BackgroundColor3:Lerp(Color3.fromRGB(255,80,80),0.3)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = cor or Color3.fromRGB(255,50,50)
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

-- BotÃµes adicionais
local coquetteBtn = criarBotao("Coquette Hub", nil, container, Color3.fromRGB(50,200,50))
coquetteBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Daivd977/Deivd999/refs/heads/main/pessal"))()
end)

local cartolaBtn = criarBotao("Cartola Hub", nil, container, Color3.fromRGB(50,150,255))
cartolaBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
end)

local chaosBtn = criarBotao("K Chaos Hub", nil, container, Color3.fromRGB(150,50,200))
chaosBtn.MouseButton1Click:Connect(function()
    loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\103\105\116\104\117\98\46\99\111\109\47\99\111\110\116\97\116\101\115\116\101\56\47\67\104\97\111\115\72\117\98\86\51\47\114\97\119\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\67\104\97\111\115\72\117\98\86\51\79\98\102\46\116\120\116\34\41\41\40\41")()
end)

-- BotÃ£o Nytherune Hub
local nytheruneBtn = criarBotao("Nytherune Hub", nil, container, Color3.fromRGB(255,150,0))
nytheruneBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wx-sources/spacecomm/refs/heads/main/nytheruneplus"))()
end)

criarBotao("Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", container)
criarBotao("Dex Explorer","https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/DexExplorer.lua", container)

-- SeÃ§Ã£o Sky Box
local skyFrame = Instance.new("Frame", frame)
skyFrame.Size = UDim2.new(1,-10,0.2,-10)
skyFrame.Position = UDim2.new(0,5,0.75,0)
skyFrame.BackgroundTransparency = 1
skyFrame.ZIndex = 2

local skyLayout = Instance.new("UIListLayout", skyFrame)
skyLayout.FillDirection = Enum.FillDirection.Horizontal
skyLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
skyLayout.VerticalAlignment = Enum.VerticalAlignment.Center
skyLayout.Padding = UDim.new(0,10)

-- BotÃµes Sky Box
local skyOnBtn = Instance.new("TextButton")
skyOnBtn.Name = "SkyOnBtn"
skyOnBtn.Text = "Ativar Sky Box"
skyOnBtn.Size = UDim2.new(0,140,0,35)
skyOnBtn.BackgroundColor3 = Color3.fromRGB(50,150,255)
skyOnBtn.TextColor3 = Color3.fromRGB(255,255,255)
skyOnBtn.TextScaled = true
skyOnBtn.Font = Enum.Font.SourceSansBold
skyOnBtn.BorderSizePixel = 0
skyOnBtn.ZIndex = 2
skyOnBtn.Parent = skyFrame

local cornerOn = Instance.new("UICorner", skyOnBtn)
cornerOn.CornerRadius = UDim.new(0,10)

skyOnBtn.MouseEnter:Connect(function()
    skyOnBtn.BackgroundColor3 = Color3.fromRGB(80,180,255)
end)
skyOnBtn.MouseLeave:Connect(function()
    skyOnBtn.BackgroundColor3 = Color3.fromRGB(50,150,255)
end)

local sky
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

local skyOffBtn = Instance.new("TextButton")
skyOffBtn.Name = "SkyOffBtn"
skyOffBtn.Text = "Remover Sky Box"
skyOffBtn.Size = UDim2.new(0,140,0,35)
skyOffBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
skyOffBtn.TextColor3 = Color3.fromRGB(255,255,255)
skyOffBtn.TextScaled = true
skyOffBtn.Font = Enum.Font.SourceSansBold
skyOffBtn.BorderSizePixel = 0
skyOffBtn.ZIndex = 2
skyOffBtn.Parent = skyFrame

local cornerOff = Instance.new("UICorner", skyOffBtn)
cornerOff.CornerRadius = UDim.new(0,10)

skyOffBtn.MouseEnter:Connect(function()
    skyOffBtn.BackgroundColor3 = Color3.fromRGB(255,80,80)
end)
skyOffBtn.MouseLeave:Connect(function()
    skyOffBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
end)

skyOffBtn.MouseButton1Click:Connect(function()
    if sky then
        sky:Destroy()
        sky = nil
        criarNotificacao("Sky Box", "Sky Box removido!", 3)
    end
end)

-- BotÃ£o fechar
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0,40,0,40)
closeBtn.Position = UDim2.new(1,-45,0,5)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
local cornerClose = Instance.new("UICorner", closeBtn)
cornerClose.CornerRadius = UDim.new(0,8)

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