-- Freecam Simples (LOCAL SCRIPT)
-- Use teclas WASD para mover a câmera e mouse para girar

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- Configurações
local speed = 1 -- Velocidade do freecam
local sensitivity = 0.2 -- Sensibilidade do mouse

-- Variáveis
local camCF = camera.CFrame
local moving = {W = false, A = false, S = false, D = false, Q = false, E = false}
local freecamEnabled = false

-- Função de toggle (ativa/desativa o freecam com a tecla F)
UIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.F then
		freecamEnabled = not freecamEnabled
		if freecamEnabled then
			camCF = camera.CFrame
			camera.CameraType = Enum.CameraType.Scriptable
		else
			camera.CameraType = Enum.CameraType.Custom
		end
	end

	-- Detecta teclas de movimento
	for k,_ in pairs(moving) do
		if input.KeyCode == Enum.KeyCode[k] then
			moving[k] = true
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	for k,_ in pairs(moving) do
		if input.KeyCode == Enum.KeyCode[k] then
			moving[k] = false
		end
	end
end)

-- Movimento da câmera
RunService.RenderStepped:Connect(function(dt)
	if freecamEnabled then
		local move = Vector3.zero
		if moving.W then move += camCF.LookVector end
		if moving.S then move -= camCF.LookVector end
		if moving.A then move -= camCF.RightVector end
		if moving.D then move += camCF.RightVector end
		if moving.E then move += camCF.UpVector end
		if moving.Q then move -= camCF.UpVector end

		-- Movimento suave
		camCF = camCF + move * speed

		-- Rotação com o mouse
		local delta = UIS:GetMouseDelta()
		local rotX = CFrame.Angles(0, -delta.X * sensitivity * dt, 0)
		local rotY = CFrame.Angles(-delta.Y * sensitivity * dt, 0, 0)
		camCF = camCF * rotX * rotY

		camera.CFrame = camCF
	end
end)