-- LocalScript: Painel da Invasão Furry 🐺😂
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- IDs
local imageId = "6410937952" -- imagem furry
local meshId = "3594051268" -- Mesh do Legoshi
local textureId = "3594051363" -- Textura do Legoshi
local firstAudioId = "5580938572" -- alerta
local loopAudioId = "8995417966" -- sirene

-- ===== FUNÇÕES DO APOCALIPSE =====

-- Skybox piscando
local function chaosSkybox()
	local sky = Lighting:FindFirstChildWhichIsA("Sky")
	if not sky then
		sky = Instance.new("Sky", Lighting)
	end
	for _, face in pairs({"Bk","Dn","Ft","Lf","Rt","Up"}) do
		sky["Skybox"..face] = "rbxassetid://"..imageId
	end
	spawn(function()
		while true do
			for _, face in pairs({"Bk","Dn","Ft","Lf","Rt","Up"}) do
				sky["Skybox"..face] = "rbxassetid://"..imageId
			end
			wait(0.2)
		end
	end)
end

-- Trocar todas texturas/decals
local function chaosTextures()
	for _, obj in pairs(Workspace:GetDescendants()) do
		if obj:IsA("Decal") or obj:IsA("Texture") then
			obj.Texture = "rbxassetid://"..imageId
		end
	end
end

-- Tocar áudio
local function playChaosAudio()
	local firstSound = Instance.new("Sound", Workspace)
	firstSound.SoundId = "rbxassetid://"..firstAudioId
	firstSound.Volume = 5
	firstSound:Play()
	firstSound.Ended:Connect(function()
		local loopSound = Instance.new("Sound", Workspace)
		loopSound.SoundId = "rbxassetid://"..loopAudioId
		loopSound.Looped = true
		loopSound.Volume = 5
		loopSound:Play()
	end)
end

-- Spawnar Legoshi perseguidor
local function spawnLegoshi(speed)
	local character = player.Character or player.CharacterAdded:Wait()
	local legoshi = Instance.new("MeshPart")
	legoshi.MeshId = "rbxassetid://"..meshId
	legoshi.TextureID = "rbxassetid://"..textureId
	legoshi.Size = Vector3.new(6, 12, 6)
	legoshi.Anchored = false
	legoshi.CanCollide = false
	legoshi.Name = "LegoshiChaser"
	legoshi.Parent = Workspace
	legoshi.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, legoshi.Size.Y/2, -20)

	RunService.Heartbeat:Connect(function()
		if character and character:FindFirstChild("HumanoidRootPart") then
			local targetPos = character.HumanoidRootPart.Position + Vector3.new(0, legoshi.Size.Y/2, 0)
			local direction = (targetPos - legoshi.Position).Unit
			local newPos = legoshi.Position + direction * (speed or 0.8)
			legoshi.CFrame = CFrame.new(newPos, targetPos)
		end
	end)
end

-- Ativar tudo (modo HARDCORE)
local function hardcoreMode()
	chaosSkybox()
	chaosTextures()
	playChaosAudio()
	for i = 1, 5 do
		spawnLegoshi(1.5) -- vários Legoshis rápidos
	end
end

-- ===== GUI DO PAINEL =====

local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "FurryApocalypseGui"

-- Botão vermelho principal
local mainButton = Instance.new("TextButton", screenGui)
mainButton.Size = UDim2.new(0,200,0,50)
mainButton.Position = UDim2.new(0.5,-100,0.9,-50)
mainButton.Text = "🔴 INICIAR INVASÃO"
mainButton.TextColor3 = Color3.new(1,1,1)
mainButton.BackgroundColor3 = Color3.new(0.8,0,0)

-- Painel de opções
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0,300,0,200)
frame.Position = UDim2.new(0.5,-150,0.5,-100)
frame.BackgroundColor3 = Color3.new(0,0,0)
frame.Visible = false

-- Botões do painel
local function createButton(name, yPos, callback)
	local btn = Instance.new("TextButton", frame)
	btn.Size = UDim2.new(0,280,0,40)
	btn.Position = UDim2.new(0,10,0,yPos)
	btn.Text = name
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
	btn.MouseButton1Click:Connect(callback)
end

createButton("🌌 Ativar Skybox", 10, chaosSkybox)
createButton("🖼 Spam de Texturas", 60, chaosTextures)
createButton("📢 Tocar Sirene", 110, playChaosAudio)
createButton("🐺 Spawnar Legoshi", 160, function() spawnLegoshi(0.8) end)
createButton("☠ Modo HARDCORE", 210, hardcoreMode)

-- Abrir/fechar painel
mainButton.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)
