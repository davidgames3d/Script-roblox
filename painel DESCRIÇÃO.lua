-- Script para um painel arrastável com dois botões no Roblox
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Criação do ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DraggablePanelGui"
screenGui.Parent = player.PlayerGui
screenGui.ResetOnSpawn = false

-- Criação do Frame (painel principal)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150) -- Tamanho do painel
frame.Position = UDim2.new(0.5, -100, 0.5, -75) -- Centralizado na tela
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Cor de fundo
frame.BorderSizePixel = 2
frame.Active = true -- Permite interação
frame.Parent = screenGui

-- Adiciona cantos arredondados ao painel
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10) -- Raio dos cantos
corner.Parent = frame

-- Variáveis para arrastar
local dragging = false
local dragStart = nil
local startPos = nil

-- Função para atualizar a posição do painel
local function updatePosition(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

-- Conexão para arrastar com mouse ou toque
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end -- Ignora se estiver interagindo com outro elemento
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if (input.Position - frame.Position - frame.Size/2).Magnitude <= frame.Size.X.Offset then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end
end)

UserInputService.InputChanged:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        updatePosition(input)
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Criação do Botão 1
local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 80, 0, 40)
button1.Position = UDim2.new(0, 20, 0, 20)
button1.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
button1.Text = "TP ALL"
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.Parent = frame

-- Adiciona cantos arredondados ao Botão 1
local button1Corner = Instance.new("UICorner")
button1Corner.CornerRadius = UDim.new(0, 8)
button1Corner.Parent = button1

-- Função do Botão 1
button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/painel.lua"))()
    -- Adicione aqui a ação desejada para o Botão 1
end)

-- Criação do Botão 2
local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 80, 0, 40)
button2.Position = UDim2.new(0, 100, 0, 20)
button2.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
button2.Text = "flux hub"
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.Parent = frame

-- Adiciona cantos arredondados ao Botão 2
local button2Corner = Instance.new("UICorner")
button2Corner.CornerRadius = UDim.new(0, 8)
button2Corner.Parent = button2

-- Função do Botão 2
button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/flux%20hub.lua"))()
    -- Adicione aqui a ação desejada para o Botão 2
end)