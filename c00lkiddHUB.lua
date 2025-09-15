-- Notificação estilo Roblox (com ícone e som)
-- Autor: Davidgames3d V

local TweenService = game:GetService("TweenService")

-- Criar ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

-- Frame principal
local Notification = Instance.new("Frame")
Notification.Size = UDim2.new(0, 300, 0, 80)
Notification.Position = UDim2.new(1, -310, 0, 40) -- canto superior direito
Notification.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Notification.BorderSizePixel = 0
Notification.BackgroundTransparency = 0.1
Notification.Parent = ScreenGui

-- Arredondar cantos
local UICorner = Instance.new("UICorner", Notification)
UICorner.CornerRadius = UDim.new(0, 10)

-- Ícone
local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 50, 0, 50)
Icon.Position = UDim2.new(0, 15, 0, 15)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://113906738788099" -- ícone de check (Roblox)
Icon.Parent = Notification

-- Texto
local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, -80, 1, -20)
TextLabel.Position = UDim2.new(0, 75, 0, 10)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "criado por davidgames3d e Dduduols"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 16
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
TextLabel.Parent = Notification

-- Som da notificação
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://117591060229396" -- som "ding"
Sound.Volume = 1
Sound.Parent = Notification
Sound:Play()

-- Tween para sumir
task.wait(5) -- espera 5 segundos
local Tween = TweenService:Create(Notification, TweenInfo.new(1), {Position = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1})
Tween:Play()

Tween.Completed:Connect(function()
    ScreenGui:Destroy()
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/c.lua"))()