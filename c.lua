-- // GUI de Key + Copiar Canal
-- Autor: Davidgames3d V

if game.CoreGui:FindFirstChild("KeyGui") then
    game.CoreGui.KeyGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeyGui"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 180)
Frame.Position = UDim2.new(0.5, -150, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Frame.BorderSizePixel = 4
Frame.BorderColor3 = Color3.fromRGB(0,0,0)
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Text = "C00LKID GUI"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.Arcade
Title.TextSize = 22
Title.Parent = Frame

local CopyButton = Instance.new("TextButton")
CopyButton.Text = "Copiar Canal"
CopyButton.Size = UDim2.new(0.8, 0, 0, 40)
CopyButton.Position = UDim2.new(0.1, 0, 0.3, 0)
CopyButton.BackgroundColor3 = Color3.fromRGB(100,0,0)
CopyButton.TextColor3 = Color3.fromRGB(255,255,255)
CopyButton.Font = Enum.Font.Arcade
CopyButton.TextSize = 18
CopyButton.Parent = Frame

local KeyBox = Instance.new("TextBox")
KeyBox.PlaceholderText = "Digite a Key..."
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Position = UDim2.new(0.1, 0, 0.55, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(50,0,0)
KeyBox.TextColor3 = Color3.fromRGB(255,255,255)
KeyBox.Font = Enum.Font.Arcade
KeyBox.TextSize = 18
KeyBox.Parent = Frame

local VerifyButton = Instance.new("TextButton")
VerifyButton.Text = "Verificar Key"
VerifyButton.Size = UDim2.new(0.8, 0, 0, 40)
VerifyButton.Position = UDim2.new(0.1, 0, 0.8, 0)
VerifyButton.BackgroundColor3 = Color3.fromRGB(100,0,0)
VerifyButton.TextColor3 = Color3.fromRGB(255,255,255)
VerifyButton.Font = Enum.Font.Arcade
VerifyButton.TextSize = 18
VerifyButton.Parent = Frame

-- Função copiar link
CopyButton.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@davidgames3d?si=HuQTRLT5i7AQGl0c") -- <<< link do canal
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Copiado!";
        Text = "Link do canal foi copiado.";
        Duration = 3
    }) -- Teste híbrido: Som no Character + SoundService
-- Autor: Davidgames3d V

local musicID = 18755588842 -- troque pelo ID real do áudio

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SoundService = game:GetService("SoundService")

-- Cria no Character
local Sound1 = Instance.new("Sound")
Sound1.SoundId = "rbxassetid://"..musicID
Sound1.Volume = 5
Sound1.Looped = false
Sound1.Parent = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
Sound1:Play()

-- Cria no SoundService
local Sound2 = Instance.new("Sound")
Sound2.SoundId = "rbxassetid://"..musicID
Sound2.Volume = 5
Sound2.Looped = false
Sound2.Parent = SoundService
Sound2:Play()

-- Aviso
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "🎶 Testando Som",
        Text = "ID: "..musicID.." (Hybrid)",
        Duration = 6
    })
end)
end)

-- Função verificar key
VerifyButton.MouseButton1Click:Connect(function()
    if KeyBox.Text == "C00LKIDDMAN666" then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Key Aceita!";
            Text = "Iniciando script...",
            Duration = 3
        })
        -- <<< Aqui você bota seu loadstring
  
-- Teste híbrido: Som no Character + SoundService
-- Autor: Davidgames3d V

local musicID = 85431867458082 -- troque pelo ID real do áudio

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SoundService = game:GetService("SoundService")

-- Cria no Character
local Sound1 = Instance.new("Sound")
Sound1.SoundId = "rbxassetid://"..musicID
Sound1.Volume = 5
Sound1.Looped = false
Sound1.Parent = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
Sound1:Play()

-- Cria no SoundService
local Sound2 = Instance.new("Sound")
Sound2.SoundId = "rbxassetid://"..musicID
Sound2.Volume = 5
Sound2.Looped = false
Sound2.Parent = SoundService
Sound2:Play()

-- Aviso
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "🎶 Testando Som",
        Text = "ID: "..musicID.." (Hybrid)",
        Duration = 6
    })
end)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/c00lgui.lua"))()
        
        -- Fechar GUI depois de aceitar
        ScreenGui:Destroy()
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Key Incorreta";
            Text = "Tente novamente!",
            Duration = 3
        })
    end
-- Teste híbrido: Som no Character + SoundService
-- Autor: Davidgames3d V

local musicID = 3779045779 -- troque pelo ID real do áudio

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SoundService = game:GetService("SoundService")

-- Cria no Character
local Sound1 = Instance.new("Sound")
Sound1.SoundId = "rbxassetid://"..musicID
Sound1.Volume = 5
Sound1.Looped = false
Sound1.Parent = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
Sound1:Play()

-- Cria no SoundService
local Sound2 = Instance.new("Sound")
Sound2.SoundId = "rbxassetid://"..musicID
Sound2.Volume = 5
Sound2.Looped = false
Sound2.Parent = SoundService
Sound2:Play()

-- Aviso
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "🎶 Testando Som",
        Text = "ID: "..musicID.." (Hybrid)",
        Duration = 6
    })
end)
end)