-- LocalScript: Invasão Hacker Furry 😂
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

local imageId = "6410937952" -- imagem dos furries
local firstAudioId = "5580938572" -- áudio inicial
local loopAudioId = "8995417966" -- áudio em loop

-- Função pra mudar todas as Decals/Textures rapidamente
local function chaosTextures()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Texture = "rbxassetid://"..imageId
        end
    end
end

-- Skybox hacker-furry piscando
local function chaosSkybox()
    local sky = Lighting:FindFirstChildWhichIsA("Sky")
    if not sky then
        sky = Instance.new("Sky")
        sky.Parent = Lighting
    end
    for _, face in pairs({"Bk","Dn","Ft","Lf","Rt","Up"}) do
        sky["Skybox"..face] = "rbxassetid://"..imageId
    end
    -- Faz o céu piscar rápido
    spawn(function()
        while true do
            for i = 0,1,0.2 do
                sky.SkyboxBk = "rbxassetid://"..imageId
                sky.SkyboxFt = "rbxassetid://"..imageId
                wait(0.1)
            end
        end
    end)
end

-- Toca áudio, com loop opcional
local function playAudio(audioId, loop)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://"..audioId
    sound.Looped = loop or false
    sound.Volume = 5 -- fica alto pra zueira
    sound.Parent = Workspace
    sound:Play()
    return sound
end

-- Inicia invasão
chaosTextures()
chaosSkybox()

-- Áudio inicial
local firstSound = playAudio(firstAudioId, false)

-- Depois inicia loop infinito do segundo áudio
firstSound.Ended:Connect(function()
    playAudio(loopAudioId, true)
end)

-- Extras: efeito maluco de furries aparecendo random
spawn(function()
    while true do
        local part = Instance.new("Part")
        part.Size = Vector3.new(5,5,5)
        part.Anchored = true
        part.CanCollide = false
        part.Position = Vector3.new(math.random(-50,50),math.random(5,50),math.random(-50,50))
        part.Parent = Workspace

        local decal = Instance.new("Decal", part)
        decal.Texture = "rbxassetid://"..imageId

        game:GetService("Debris"):AddItem(part, 5) -- some depois de 5 segundos
        wait(0.3)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Cria o MeshPart
local legoshi = Instance.new("MeshPart")
legoshi.MeshId = "rbxassetid://3594051268" -- Mesh
legoshi.TextureID = "rbxassetid://3594051363" -- Textura
legoshi.Size = Vector3.new(6, 12, 6) -- Ajustei o tamanho (pode mudar se quiser maior/menor)
legoshi.Anchored = false
legoshi.CanCollide = true
legoshi.Name = "LegoshiChaser"
legoshi.Parent = workspace

-- Spawnar acima do chão (altura baseada no tamanho do mesh)
legoshi.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0, legoshi.Size.Y/2, -20)

-- Velocidade de perseguição
local speed = 0.8

-- Seguir o jogador
RunService.Heartbeat:Connect(function()
	if character and character:FindFirstChild("HumanoidRootPart") then
		local targetPos = character.HumanoidRootPart.Position + Vector3.new(0, legoshi.Size.Y/2, 0)
		local currentPos = legoshi.Position
		local direction = (targetPos - currentPos).Unit
		local newPos = currentPos + direction * speed
		legoshi.CFrame = CFrame.new(newPos, targetPos) -- agora ele "olha" pro player
	end
end)

    end
end)