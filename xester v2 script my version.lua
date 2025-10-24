--// Xester GUI by Davidgames3d 😎

-- Cria a ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "XesterGui"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Retângulo principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Active = true
MainFrame.Draggable = true -- arrastável no PC

-- Suporte pra arrastar no mobile (touch)
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(
		startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y
	)
end

MainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

MainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Quadro do título (em cima do retângulo)
local TitleFrame = Instance.new("Frame")
TitleFrame.Name = "TitleFrame"
TitleFrame.Parent = MainFrame
TitleFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TitleFrame.BorderSizePixel = 0
TitleFrame.Size = UDim2.new(1, 0, 0, 40)

-- Texto do título
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = TitleFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Xester GUI"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true

-- Botão principal
local StartButton = Instance.new("TextButton")
StartButton.Name = "StartButton"
StartButton.Parent = MainFrame
StartButton.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
StartButton.BorderSizePixel = 0
StartButton.Position = UDim2.new(0.1, 0, 0.5, 0)
StartButton.Size = UDim2.new(0.8, 0, 0.25, 0)
StartButton.Font = Enum.Font.GothamBold
StartButton.Text = "Iniciar Xester V3"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.TextScaled = true
StartButton.AutoButtonColor = true

-- Função do botão (adicione sua função aqui depois)
StartButton.MouseButton1Click:Connect(function()
	print("DAVID INVADIU O JOGO!") 
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/i1bb4a1012l.lua"))()
end)

local rButton = Instance.new("TextButton")
rButton.Name = "rButton"
rButton.Parent = MainFrame
rButton.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
rButton.BorderSizePixel = 0
rButton.Position = UDim2.new(0.1, 0, 0.30, 0)
rButton.Size = UDim2.new(0.8, 0, 0.25, 0)
rButton.Font = Enum.Font.GothamBold
rButton.Text = "MUDAR PARA R6"
rButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rButton.TextScaled = true
rButton.AutoButtonColor = true

-- Função do botão (adicione sua função aqui depois)
rButton.MouseButton1Click:Connect(function()	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-to-r6-script-working-all-game-26416"))()
end)

local bButton = Instance.new("TextButton")
bButton.Name = "bButton"
bButton.Parent = MainFrame
bButton.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
bButton.BorderSizePixel = 0
bButton.Position = UDim2.new(0.1, 0, 0, 0)
bButton.Size = UDim2.new(0.8, 0, 0.25, 0)
bButton.Font = Enum.Font.GothamBold
bButton.Text = "MUDAR PARA R6"
bButton.TextColor3 = Color3.fromRGB(255, 255, 255)
bButton.TextScaled = true
bButton.AutoButtonColor = true

-- Função do botão (adicione sua função aqui depois)
bButton.MouseButton1Click:Connect(function()	local rButton = Instance.new("TextButton")
rButton.Name = "rButton"
rButton.Parent = MainFrame
rButton.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
rButton.BorderSizePixel = 0
rButton.Position = UDim2.new(0.1, 0, 0.30, 0)
rButton.Size = UDim2.new(0.8, 0, 0.25, 0)
rButton.Font = Enum.Font.GothamBold
rButton.Text = "MUDAR PARA R6"
rButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rButton.TextScaled = true
rButton.AutoButtonColor = true

-- Função do botão (adicione sua função aqui depois)
rButton.MouseButton1Click:Connect(function()	local rButton = Instance.new("TextButton")
rButton.Name = "rButton"
rButton.Parent = MainFrame
rButton.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
rButton.BorderSizePixel = 0
rButton.Position = UDim2.new(0.1, 0, 0.30, 0)
rButton.Size = UDim2.new(0.8, 0, 0.25, 0)
rButton.Font = Enum.Font.GothamBold
rButton.Text = "VERSUS MONSTRO GIGANTE"
rButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rButton.TextScaled = true
rButton.AutoButtonColor = true

-- Função do botão (adicione sua função aqui depois)
rButton.MouseButton1Click:Connect(function()	loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Roblox-VEREUS-monster-script-3746"))()
end)