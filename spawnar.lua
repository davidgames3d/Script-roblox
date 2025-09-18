-- Serviços
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

-- FRAME PRINCIPAL
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(50,50,50)
frame.BackgroundTransparency = 0.5
frame.Parent = gui

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 10)
uicorner.Parent = frame

-- FADE DE ENTRADA
frame.BackgroundTransparency = 1
TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.5}):Play()

-- FUNÇÃO DE TWEEN
local function TweenObject(object, properties, time)
	local tween = TweenService:Create(object, TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), properties)
	tween:Play()
end

-- SONS DE CLIQUE
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://911882853"
clickSound.Volume = 0.5
clickSound.Parent = frame

-- MINI ANIMAÇÃO DE BLOCOS
local blockContainer = Instance.new("Frame")
blockContainer.Size = UDim2.new(1,0,1,0)
blockContainer.Position = UDim2.new(0,0,0,0)
blockContainer.BackgroundTransparency = 1
blockContainer.Parent = frame

local blocks = {}
for i=1,15 do
	local b = Instance.new("Frame")
	b.Size = UDim2.new(0, 20, 0, 20)
	b.Position = UDim2.new(math.random(),0,math.random(),0)
	b.BackgroundColor3 = Color3.fromRGB(0,0,0)
	b.BackgroundTransparency = 0.6
	b.AnchorPoint = Vector2.new(0.5,0.5)
	b.Parent = blockContainer
	table.insert(blocks,b)
end

-- Move os blocos
RunService.RenderStepped:Connect(function(dt)
	for _,b in pairs(blocks) do
		local x = b.Position.X.Scale + dt*0.2
		if x > 1 then x = 0 end
		b.Position = UDim2.new(x,0,b.Position.Y.Scale,b.Position.Y.Offset)
	end
end)

-- TÍTULO
local title = Instance.new("TextLabel")
title.Text = "Mesh Spawner"
title.Size = UDim2.new(1,0,0,30)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Parent = frame

-- INPUTS
local function createInput(placeholder, y)
	local box = Instance.new("TextBox")
	box.PlaceholderText = placeholder
	box.Size = UDim2.new(0.9,0,0,30)
	box.Position = UDim2.new(0.05,0,0,y)
	box.BackgroundColor3 = Color3.fromRGB(70,70,70)
	box.TextColor3 = Color3.fromRGB(255,255,255)
	box.ClearTextOnFocus = false
	box.Parent = frame
	local c = Instance.new("UICorner")
	c.Parent = box
	return box
end

local meshInput = createInput("Mesh ID", 40)
local texInput = createInput("Texture ID", 80)

-- BOTÃO SPAWN
local spawnButton = Instance.new("TextButton")
spawnButton.Text = "Spawn MeshPart"
spawnButton.Size = UDim2.new(0.9,0,0,40)
spawnButton.Position = UDim2.new(0.05,0,0,130)
spawnButton.BackgroundColor3 = Color3.fromRGB(100,100,100)
spawnButton.TextColor3 = Color3.fromRGB(255,255,255)
spawnButton.Parent = frame
local mc3 = Instance.new("UICorner")
mc3.Parent = spawnButton

-- BOTÃO FECHAR
local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Size = UDim2.new(0,30,0,30)
closeButton.Position = UDim2.new(1, -35,0,5)
closeButton.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeButton.TextColor3 = Color3.fromRGB(255,255,255)
closeButton.Parent = frame
local closeCorner = Instance.new("UICorner")
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
	clickSound:Play()
	TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 1}):Play()
	wait(0.3)
	gui:Destroy()
end)

-- BOTÃO SPAWN ANIMAÇÃO
spawnButton.MouseEnter:Connect(function()
	TweenObject(spawnButton, {BackgroundColor3 = Color3.fromRGB(150,150,150)}, 0.2)
end)
spawnButton.MouseLeave:Connect(function()
	TweenObject(spawnButton, {BackgroundColor3 = Color3.fromRGB(100,100,100)}, 0.2)
end)
spawnButton.MouseButton1Click:Connect(function()
	clickSound:Play()
	TweenObject(spawnButton, {BackgroundColor3 = Color3.fromRGB(80,80,80)}, 0.1)
	wait(0.1)
	TweenObject(spawnButton, {BackgroundColor3 = Color3.fromRGB(150,150,150)}, 0.1)

	local meshId = meshInput.Text
	local texId = texInput.Text
	if meshId ~= "" then
		local part = Instance.new("MeshPart")
		part.MeshId = "rbxassetid://"..meshId
		if texId ~= "" then
			part.TextureID = "rbxassetid://"..texId
		end
		part.Size = Vector3.new(5,5,5)
		part.Position = player.Character and (player.Character.Head.Position + player.Character.Head.CFrame.LookVector*5) or Vector3.new(0,5,0)
		part.Anchored = true
		part.Parent = workspace
	end
end)

-- ARRASTAR GUI
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

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
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)