-- Freecam Mobile (LOCAL SCRIPT)
-- Com botões na tela para mover a câmera

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Configurações
local speed = 1
local sensitivity = 0.2

-- Variáveis
local camCF = camera.CFrame
local freecamEnabled = false
local moving = {Forward = 0, Right = 0, Up = 0}

-- Criar GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

-- Botão Toggle Freecam
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0,120,0,40)
toggleBtn.Position = UDim2.new(0.02,0,0.85,0)
toggleBtn.Text = "Freecam OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.Parent = screenGui

toggleBtn.MouseButton1Click:Connect(function()
	freecamEnabled = not freecamEnabled
	if freecamEnabled then
		camCF = camera.CFrame
		camera.CameraType = Enum.CameraType.Scriptable
		toggleBtn.Text = "Freecam ON"
	else
		camera.CameraType = Enum.CameraType.Custom
		toggleBtn.Text = "Freecam OFF"
	end
end)

-- Joystick de movimento
local moveStick = Instance.new("Frame")
moveStick.Size = UDim2.new(0,120,0,120)
moveStick.Position = UDim2.new(0.05,0,0.65,0)
moveStick.BackgroundColor3 = Color3.fromRGB(60,60,60)
moveStick.BackgroundTransparency = 0.5
moveStick.Parent = screenGui

local thumb = Instance.new("Frame")
thumb.Size = UDim2.new(0,50,0,50)
thumb.Position = UDim2.new(0.5,-25,0.5,-25)
thumb.BackgroundColor3 = Color3.fromRGB(200,200,200)
thumb.BackgroundTransparency = 0.3
thumb.AnchorPoint = Vector2.new(0.5,0.5)
thumb.Parent = moveStick

local dragging = false
local startPos

thumb.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		startPos = input.Position
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
		thumb.Position = UDim2.new(0.5,-25,0.5,-25)
		moving.Forward = 0
		moving.Right = 0
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.Touch then
		local delta = (input.Position - startPos) / 50
		delta = Vector2.new(math.clamp(delta.X,-1,1), math.clamp(delta.Y,-1,1))
		thumb.Position = UDim2.new(0.5 + delta.X*0.4, -25, 0.5 + delta.Y*0.4, -25)
		moving.Forward = -delta.Y
		moving.Right = delta.X
	end
end)

-- Botões subir/descer
local upBtn = Instance.new("TextButton")
upBtn.Size = UDim2.new(0,60,0,60)
upBtn.Position = UDim2.new(0.85,0,0.65,0)
upBtn.Text = "↑"
upBtn.BackgroundColor3 = Color3.fromRGB(40,120,40)
upBtn.TextColor3 = Color3.new(1,1,1)
upBtn.Parent = screenGui

local downBtn = Instance.new("TextButton")
downBtn.Size = UDim2.new(0,60,0,60)
downBtn.Position = UDim2.new(0.85,0,0.75,0)
downBtn.Text = "↓"
downBtn.BackgroundColor3 = Color3.fromRGB(120,40,40)
downBtn.TextColor3 = Color3.new(1,1,1)
downBtn.Parent = screenGui

upBtn.MouseButton1Down:Connect(function() moving.Up = 1 end)
upBtn.MouseButton1Up:Connect(function() moving.Up = 0 end)
downBtn.MouseButton1Down:Connect(function() moving.Up = -1 end)
downBtn.MouseButton1Up:Connect(function() moving.Up = 0 end)

-- Movimento + rotação
RunService.RenderStepped:Connect(function(dt)
	if freecamEnabled then
		local move = Vector3.new()
		move += camCF.LookVector * moving.Forward
		move += camCF.RightVector * moving.Right
		move += camCF.UpVector * moving.Up

		camCF = camCF + move * speed

		-- Rotação pelo dedo arrastando na tela
		local delta = UIS:GetMouseDelta()
		local rotX = CFrame.Angles(0, -delta.X * sensitivity * dt, 0)
		local rotY = CFrame.Angles(-delta.Y * sensitivity * dt, 0, 0)
		camCF = camCF * rotX * rotY

		camera.CFrame = camCF
	end
end)