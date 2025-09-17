--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

--// GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Background Image
local Background = Instance.new("ImageLabel")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0, 0, 0, 0)
Background.BackgroundTransparency = 1
Background.Image = "" -- Coloque aqui o ID da imagem depois, ex: "rbxassetid://12345678"
Background.Parent = Frame

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0.1, 0)
FrameCorner.Parent = Frame

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 24
CloseButton.Parent = Frame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

-- Beta Text
local BetaText = Instance.new("TextLabel")
BetaText.Size = UDim2.new(0, 250, 0, 90)
BetaText.Position = UDim2.new(0.5, -125, 0.5, -25)
BetaText.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BetaText.Text = "Bem-vindo! Sempre lembre de ir pro meu canal ou servidor do Discord"
BetaText.TextColor3 = Color3.fromRGB(255, 255, 255)
BetaText.Font = Enum.Font.SourceSansBold
BetaText.TextSize = 16
BetaText.TextWrapped = true
BetaText.Parent = ScreenGui

local BetaCorner = Instance.new("UICorner")
BetaCorner.CornerRadius = UDim.new(0.1, 0)
BetaCorner.Parent = BetaText

-- Fade out Beta Text
task.delay(3, function()
    for i = 0, 1, 0.02 do
        BetaText.TextTransparency = i
        BetaText.BackgroundTransparency = i
        task.wait(0.01)
    end
    BetaText:Destroy()
end)

-- TextBox for Music ID
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 200, 0, 40)
TextBox.Position = UDim2.new(0.5, -100, 0.3, -20)
TextBox.PlaceholderText = "Digite o ID da música"
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 18
TextBox.Parent = Frame

-- Play Button
local PlayButton = Instance.new("TextButton")
PlayButton.Size = UDim2.new(0, 100, 0, 40)
PlayButton.Position = UDim2.new(0.5, -50, 0.5, 20)
PlayButton.Text = "Play"
PlayButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
PlayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayButton.Font = Enum.Font.SourceSansBold
PlayButton.TextSize = 18
PlayButton.Parent = Frame

-- Pause/Resume Button
local PauseButton = Instance.new("TextButton")
PauseButton.Size = UDim2.new(0, 100, 0, 40)
PauseButton.Position = UDim2.new(0.5, -50, 0.7, 20)
PauseButton.Text = "Pause"
PauseButton.BackgroundColor3 = Color3.fromRGB(200, 200, 0)
PauseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
PauseButton.Font = Enum.Font.SourceSansBold
PauseButton.TextSize = 18
PauseButton.Parent = Frame

-- Volume Slider
local VolumeLabel = Instance.new("TextLabel")
VolumeLabel.Size = UDim2.new(0, 60, 0, 20)
VolumeLabel.Position = UDim2.new(0.05, 0, 0.85, 0)
VolumeLabel.Text = "Volume"
VolumeLabel.TextColor3 = Color3.fromRGB(255,255,255)
VolumeLabel.BackgroundTransparency = 1
VolumeLabel.Font = Enum.Font.SourceSansBold
VolumeLabel.TextSize = 14
VolumeLabel.Parent = Frame

local VolumeSlider = Instance.new("Frame")
VolumeSlider.Size = UDim2.new(0, 150, 0, 5)
VolumeSlider.Position = UDim2.new(0.25, 0, 0.88, 0)
VolumeSlider.BackgroundColor3 = Color3.fromRGB(100,100,100)
VolumeSlider.Parent = Frame

local VolumeFill = Instance.new("Frame")
VolumeFill.Size = UDim2.new(0.5,0,1,0) -- Start at 50%
VolumeFill.BackgroundColor3 = Color3.fromRGB(0,170,0)
VolumeFill.Parent = VolumeSlider

-- Sound Object
local Sound = Instance.new("Sound")
Sound.Volume = 0.5
Sound.Parent = game.Workspace
Sound.Looped = true

-- Functions
local function fadeSound(targetVolume, duration)
    local initial = Sound.Volume
    for i = 0,1,0.05 do
        Sound.Volume = initial + (targetVolume - initial) * i
        task.wait(duration/20)
    end
    Sound.Volume = targetVolume
end

local function playMusic(id)
    local musicId = tonumber(id)
    if musicId then
        if Sound.IsPlaying then
            fadeSound(0,0.5)
            Sound:Stop()
        end
        Sound.SoundId = "rbxassetid://" .. musicId
        Sound:Play()
        fadeSound(0.5,0.5)
    else
        warn("Digite um ID válido de música!")
    end
end

-- Button Connections
PlayButton.MouseButton1Click:Connect(function()
    playMusic(TextBox.Text)
end)

PauseButton.MouseButton1Click:Connect(function()
    if Sound.IsPlaying then
        Sound:Pause()
        PauseButton.Text = "Resume"
    else
        Sound:Resume()
        PauseButton.Text = "Pause"
    end
end)

-- Volume Slider interaction
VolumeSlider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local function updateVolume(posX)
            local relative = math.clamp((posX - VolumeSlider.AbsolutePosition.X)/VolumeSlider.AbsoluteSize.X,0,1)
            VolumeFill.Size = UDim2.new(relative,0,1,0)
            Sound.Volume = relative
        end

        updateVolume(input.Position.X)

        local moveConn
        moveConn = game:GetService("UserInputService").InputChanged:Connect(function(move)
            if move.UserInputType == input.UserInputType then
                updateVolume(move.Position.X)
            end
        end)

        local releaseConn
        releaseConn = game:GetService("UserInputService").InputEnded:Connect(function(release)
            if release.UserInputType == input.UserInputType then
                moveConn:Disconnect()
                releaseConn:Disconnect()
            end
        end)
    end
end)

-- Close Button
CloseButton.MouseButton1Click:Connect(function()
    if Sound.IsPlaying then
        fadeSound(0,0.5)
        Sound:Stop()
    end
    ScreenGui:Destroy()
end)