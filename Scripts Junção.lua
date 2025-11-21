local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

local screen = Instance.new("ScreenGui")
screen.Name = "ScriptHub"
screen.ResetOnSpawn = false
screen.Parent = pgui

-- Botão toggle (sempre por cima)
local toggle = Instance.new("ImageButton")
toggle.Size = UDim2.new(0,70,0,70)
toggle.Position = UDim2.new(0,20,0.5,-35)
toggle.BackgroundTransparency = 1
toggle.Image = "rbxassetid://11931487874"   -- seu ID aqui
toggle.ZIndex = 10
toggle.Parent = screen

local tc = Instance.new("UICorner", toggle)
tc.CornerRadius = UDim.new(0,16)

-- Frame principal
local main = Instance.new("Frame")
main.Size = UDim2.new(0,380,0,500)
main.Position = UDim2.new(0.5,-190,0.5,-250)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.BackgroundTransparency = 0.4
main.Visible = false
main.ZIndex = 1
main.Parent = screen

local mc = Instance.new("UICorner", main)
mc.CornerRadius = UDim.new(0,18)

-- Blur
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

-- Tweens
local openTween = TweenService:Create(main, TweenInfo.new(0.4,Enum.EasingStyle.Quint), {Position = UDim2.new(0.5,-190,0.5,-250)})
local closeTween = TweenService:Create(main, TweenInfo.new(0.35,Enum.EasingStyle.Quint), {Position = UDim2.new(0.5,-190,-1,0)})

-- Barra de busca
local search = Instance.new("TextBox")
search.Size = UDim2.new(0.94,0,0,45)
search.Position = UDim2.new(0.03,0,0,15)
search.BackgroundColor3 = Color3.fromRGB(30,30,30)
search.PlaceholderText = "Pesquisar script..."
search.TextColor3 = Color3.new(1,1,1)
search.Font = Enum.Font.GothamBold
search.TextSize = 18
search.ClearTextOnFocus = false
search.ZIndex = 2
search.Parent = main

local sc = Instance.new("UICorner", search)
sc.CornerRadius = UDim.new(0,12)

-- ScrollingFrame dos scripts
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(0.94,0,0,420)
scroll.Position = UDim2.new(0.03,0,0,80)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 6
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ZIndex = 2
scroll.Parent = main

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,10)

-- Tabela de scripts (adicione quantos quiser)
local Scripts = {
    {Name = "Fly v3", Load = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/dqtix/fly/main/v3.lua"))()]]},
    {Name = "Infinite Yield", Load = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()]]},
    {Name = "Owl Hub", Load = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))()]]},
    {Name = "Dex Explorer", Load = [[loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()]]},
    {Name = "BTools", Load = [[loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()]]},{Name = "cartola hub", Load = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Cartola-Hub-58122"))()]]},Name = "tiger x hub", Load = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-tiger-x-hub-21766"))()]]},Name = "c00lgui reborn", Load = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-By-v3rx-64424"))()]]},Name = "black hub", Load = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/BLACKHUB%E2%9A%AB%F0%9F%8C%98.lua"))()]]},
}

local buttons = {}

for _,v in pairs(Scripts) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-10,0,55)
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.BackgroundTransparency = 0.3
    btn.Text = v.Name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 20
    btn.ZIndex = 3
    btn.Parent = scroll

    local bc = Instance.new("UICorner", btn)
    bc.CornerRadius = UDim.new(0,12)

    btn.Activated:Connect(function()
        loadstring(v.Load)()
    end)

    table.insert(buttons, {Button = btn, Name = string.lower(v.Name)})
end

-- Pesquisa
search:GetPropertyChangedSignal("Text"):Connect(function()
    local term = string.lower(search.Text)
    for _,v in pairs(buttons) do
        v.Button.Visible = term == "" or string.find(v.Name, term)
    end
end)

-- Drag do botão toggle
local dragging = false
local dragStart, startPos

toggle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = toggle.Position
    end
end)

toggle.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        toggle.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

toggle.InputEnded:Connect(function()
    dragging = false
end)

-- Abrir/Fechar
local open = false
toggle.Activated:Connect(function()
    open = not open
    if open then
        main.Position = UDim2.new(0.5,-190,-1,0)
        main.Visible = true
        openTween:Play()
        TweenService:Create(blur, TweenInfo.new(0.4), {Size = 20}):Play()
    else
        closeTween:Play()
        TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
        task.delay(0.4, function() main.Visible = false end)
    end
end)
