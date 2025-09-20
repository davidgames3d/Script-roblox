local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local HRP = char:WaitForChild("HumanoidRootPart")

-- Função pra tocar áudio
local function playSound(id, volume)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://"..id
    sound.Volume = volume or 5
    sound.Parent = SoundService
    sound:Play()
    return sound
end

-- Função pra criar parte com tween de subida
local function makeRisingPart(size, pos, color, delay)
    local p = Instance.new("Part")
    p.Size = size
    p.Anchored = true
    p.CanCollide = true
    p.Material = Enum.Material.Slate
    p.Color = color
    p.CFrame = pos * CFrame.new(0,-50,0) -- começa debaixo do chão
    p.Parent = workspace

    task.delay(delay or 0, function()
        local tween = TweenService:Create(p, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = pos})
        tween:Play()
    end)
    return p
end

-- Função para spawnar templo emergindo
local function spawnTempleRising(center)
    -- Chão
    makeRisingPart(Vector3.new(100,1,100), center * CFrame.new(0,-1,0), Color3.fromRGB(30,30,30), 0)

    -- Pilares
    local delay = 0.3
    for x = -40,40,40 do
        for z = -40,40,40 do
            makeRisingPart(Vector3.new(5,30,5), center * CFrame.new(x,15,z), Color3.fromRGB(50,50,50), delay)
            delay += 0.2
        end
    end

    -- Paredes
    makeRisingPart(Vector3.new(100,30,5), center * CFrame.new(0,15,-50), Color3.fromRGB(40,40,40), 0.5)
    makeRisingPart(Vector3.new(100,30,5), center * CFrame.new(0,15,50), Color3.fromRGB(40,40,40), 0.7)
    makeRisingPart(Vector3.new(5,30,100), center * CFrame.new(-50,15,0), Color3.fromRGB(40,40,40), 0.9)
    makeRisingPart(Vector3.new(5,30,100), center * CFrame.new(50,15,0), Color3.fromRGB(40,40,40), 1.1)

    -- Tochas
    task.delay(2, function()
        for x = -30,30,30 do
            for z = -30,30,30 do
                local torch = makeRisingPart(Vector3.new(1,5,1), center * CFrame.new(x,2.5,z), Color3.fromRGB(20,20,20), 0)
                local fire = Instance.new("Fire", torch)
                fire.Size = 10
                fire.Heat = 25
                fire.Color = Color3.fromRGB(180,0,255)
                fire.SecondaryColor = Color3.fromRGB(50,0,100)
            end
        end
    end)

    -- Tremor da câmera
    task.spawn(function()
        local cam = workspace.CurrentCamera
        local origCF = cam.CFrame
        for i=1,50 do
            cam.CFrame = origCF * CFrame.new(math.random(-3,3)/10, math.random(-3,3)/10, 0)
            task.wait(0.05)
        end
        cam.CFrame = origCF
    end)
end

-- Função pra criar partículas de aura nas esferas
local function createAura(part, color)
    local particle = Instance.new("ParticleEmitter")
    particle.Texture = "rbxassetid://243660364" -- exemplo de partícula
    particle.Color = ColorSequence.new(color)
    particle.LightEmission = 0.7
    particle.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2), NumberSequenceKeypoint.new(1, 0)})
    particle.Rate = 50
    particle.Lifetime = NumberRange.new(1)
    particle.Speed = NumberRange.new(0)
    particle.Parent = part
end

-- Cutscene principal
local function startCutscene()
    -- Sukuna fala primeiro
    playSound(100989421341845, 7)

    task.wait(3) -- espera a fala antes das esferas

    -- Criação das esferas
    local sphere1 = Instance.new("Part", workspace)
    sphere1.Shape = Enum.PartType.Ball
    sphere1.Size = Vector3.new(6,6,6)
    sphere1.Anchored = true
    sphere1.Material = Enum.Material.Neon
    sphere1.Color = Color3.fromRGB(0,100,255)
    sphere1.Position = HRP.Position + Vector3.new(-15,5,0)
    createAura(sphere1, Color3.fromRGB(0,100,255))

    local sphere2 = Instance.new("Part", workspace)
    sphere2.Shape = Enum.PartType.Ball
    sphere2.Size = Vector3.new(6,6,6)
    sphere2.Anchored = true
    sphere2.Material = Enum.Material.Neon
    sphere2.Color = Color3.fromRGB(255,0,0)
    sphere2.Position = HRP.Position + Vector3.new(15,5,0)
    createAura(sphere2, Color3.fromRGB(255,0,0))

    -- Tween aproximando
    local tween1 = TweenService:Create(sphere1, TweenInfo.new(3), {Position = HRP.Position + Vector3.new(-2,5,0)})
    local tween2 = TweenService:Create(sphere2, TweenInfo.new(3), {Position = HRP.Position + Vector3.new(2,5,0)})

    tween1:Play()
    tween2:Play()

    tween2.Completed:Connect(function()
        -- Som de explosão
        playSound(138081500, 8) -- exemplo boom

        -- Flash branco
        local explosion = Instance.new("Explosion")
        explosion.Position = HRP.Position
        explosion.BlastRadius = 0
        explosion.Parent = workspace

        local flash = Instance.new("ScreenGui", player.PlayerGui)
        local frame = Instance.new("Frame", flash)
        frame.BackgroundColor3 = Color3.new(1,1,1)
        frame.Size = UDim2.new(1,0,1,0)
        frame.BackgroundTransparency = 0
        TweenService:Create(frame, TweenInfo.new(2), {BackgroundTransparency = 1}):Play()

        -- Som expansão de domínio
        playSound(106690630503051, 7)

        -- Trocar skybox
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://9823596053"
        sky.SkyboxFt = "rbxassetid://9823596053"
        sky.SkyboxLf = "rbxassetid://9823596053"
        sky.SkyboxRt = "rbxassetid://9823596053"
        sky.SkyboxUp = "rbxassetid://9823596053"
        sky.SkyboxDn = "rbxassetid://9823596053"
        Lighting:ClearAllChildren()
        sky.Parent = Lighting

        -- Templo emergindo
        task.wait(2)
        spawnTempleRising(HRP.CFrame * CFrame.new(0,0,-10))
    end)
end

startCutscene()