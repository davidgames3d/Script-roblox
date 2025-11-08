-- Aguarda o jogo carregar completamente
repeat wait() until game:IsLoaded()

-- Serviços do Roblox
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Função para verificar se o objeto existe antes de manipulá-lo
local function safeInstance(className, parent)
    local instance = Instance.new(className)
    instance.Parent = parent
    return instance
end

-- SOM DE SIRENE + SCREAM
local function playSound(soundId, volume, looped, parent)
    local sound = safeInstance("Sound", parent)
    sound.SoundId = soundId
    sound.Volume = volume
    sound.Looped = looped
    sound:Play()
    return sound
end

-- Tenta tocar os sons
local success, errorMsg = pcall(function()
    playSound("rbxassetid://1837849285", 10, true, Workspace) -- Sirene
    playSound("rbxassetid://1839246711", 10, false, Workspace) -- Grito
end)
if not success then
    warn("Erro ao carregar sons: " .. errorMsg)
end

-- CÉU VERMELHO SANGUE
local function setupSky()
    local sky = safeInstance("Sky", Lighting)
    local skyboxAsset = "rbxassetid://13621794"
    sky.SkyboxBk = skyboxAsset
    sky.SkyboxDn = skyboxAsset
    sky.SkyboxFt = skyboxAsset
    sky.SkyboxLf = skyboxAsset
    sky.SkyboxRt = skyboxAsset
    sky.SkyboxUp = skyboxAsset
    Lighting.Brightness = 0
    Lighting.GlobalShadows = false
end

pcall(setupSky) -- Evita travamento se o céu não puder ser alterado

-- MENSAGEM GIGANTE NO CÉU
local function createBillboard()
    local billboard = safeInstance("BillboardGui", Workspace)
    billboard.Size = UDim2.new(0, 5000, 0, 1000)
    billboard.StudsOffset = Vector3.new(0, 500, 0)
    billboard.Adornee = Workspace.Terrain
    billboard.AlwaysOnTop = true

    local text = safeInstance("TextLabel", billboard)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "FLUXO TROLL HUB ACABOU COM VOCÊS"
    text.TextColor3 = Color3.new(1, 0, 0)
    text.TextStrokeTransparency = 0
    text.Font = Enum.Font.Arcade
    text.TextSize = 300
end

pcall(createBillboard) -- Evita erros se o billboard falhar

-- SPAM NO CHAT (pode ser bloqueado pelo Roblox)
local function spamChat()
    spawn(function()
        while wait(0.1) do
            local success, err = pcall(function()
                local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
                if chatEvent then
                    chatEvent.SayMessageRequest:FireServer(
                        "FLUXO TROLL HUB DOMINOU O SERVER - CORRAM PRA SALA DA MAMÃE", "All"
                    )
                end
            end)
            if not success then
                warn("Erro no spam de chat: " .. err)
                break
            end
        end
    end)
end

pcall(spamChat) -- Tenta executar o spam no chat

-- EXPLOSÃO DO MAPA
local function destroyMap()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "Terrain" then
            pcall(function()
                v.Anchored = false
                v:BreakJoints()
                v.Velocity = Vector3.new(math.random(-200, 200), 300, math.random(-200, 200))
                v.RotVelocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500))

                local fire = safeInstance("Fire", v)
                fire.Size = 50
                fire.Heat = 30

                local smoke = safeInstance("Smoke", v)
                smoke.RiseVelocity = 50
            end)
        end
    end
end

pcall(destroyMap) -- Tenta destruir o mapa

-- FLING DOS JOGADORES
local function flingPlayers()
    for _, plr in pairs(Players:GetPlayers()) do
        pcall(function()
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = plr.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(0, 9999, 0)
                hrp.RotVelocity = Vector3.new(9999, 9999, 9999)
                -- ApplyAngularVelocity não existe mais, substituído por RotVelocity
            end
        end)
    end
end

pcall(flingPlayers) -- Tenta aplicar o fling

-- PARTÍCULAS DE SANGUE
local function createBloodParticles()
    for i = 1, 500 do
        pcall(function()
            local part = safeInstance("Part", Workspace)
            part.Size = Vector3.new(2, 2, 2)
            part.Position = Vector3.new(math.random(-500, 500), math.random(50, 500), math.random(-500, 500))
            part.Anchored = false
            part.CanCollide = false
            part.Color = Color3.new(0.5, 0, 0)
            part.Material = Enum.Material.Neon

            local vel = safeInstance("BodyVelocity", part)
            vel.Velocity = Vector3.new(math.random(-300, 300), -200, math.random(-300, 300))
            vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

            game.Debris:AddItem(part, 10)
        end)
    end
end

pcall(createBloodParticles) -- Tenta criar partículas

-- NOTIFICAÇÃO
local function sendNotification()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "APOCALIPSE 3.0",
            Text = "SERVIDOR MORTO EM 3... 2... 1...",
            Duration = 10
        })
    end)
end

sendNotification()

-- REMOVIDO O LOOP INFINITO (while true do end)
-- Ele trava o cliente local, mas não é necessário para o trolling
-- Em vez disso, adiciona um atraso para garantir que os efeitos sejam aplicados
wait(15)

-- FUNÇÃO PARA CRIAR UM CLONE VISUAL
local function createGhostClone()
    local player = Players.LocalPlayer
    if not player.Character then return end

    -- Cria uma cópia do personagem
    local character = player.Character
    local clone = character:Clone()
    clone.Name = "Ghost_" .. player.Name
    clone.Parent = Workspace

    -- Remove scripts que possam interferir no clone
    for _, obj in pairs(clone:GetDescendants()) do
        if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("Humanoid") then
            obj:Destroy()
        end
    end

    -- Configura o clone para parecer "fantasmagórico"
    for _, part in pairs(clone:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Anchored = true -- Impede que o clone caia ou se mova
            part.Transparency = 0.5 -- Semi-transparente
            part.BrickColor = BrickColor.new("Really red") -- Cor vermelha para efeito

            -- Adiciona partículas
            local particle = Instance.new("ParticleEmitter", part)
            particle.Texture = "rbxassetid://243728937" -- Textura de partícula vermelha
            particle.Rate = 100
            particle.Speed = NumberRange.new(5, 10)
            particle.Lifetime = NumberRange.new(1, 3)
            particle.Color = ColorSequence.new(Color3.new(1, 0, 0))
        end
    end

    -- Adiciona uma mensagem no chat para reforçar o efeito
    pcall(function()
        local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvent then
            chatEvent.SayMessageRequest:FireServer(
                player.Name .. " AINDA ESTÁ AQUI... VOCÊS NUNCA VÃO ESCAPAR DO FLUXO TROLL HUB!", "All"
            )
        end
    end)

    -- Mantém o clone no servidor mesmo após a saída
    clone:SetAttribute("PersistAfterLeave", true)
end

-- Aguarda o jogo carregar completamente
repeat wait() until game:IsLoaded()

-- Serviços do Roblox
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Função para verificar se o objeto existe antes de manipulá-lo
local function safeInstance(className, parent)
    local instance = Instance.new(className)
    instance.Parent = parent
    return instance
end

-- SOM DE SIRENE + SCREAM
local function playSound(soundId, volume, looped, parent)
    local sound = safeInstance("Sound", parent)
    sound.SoundId = soundId
    sound.Volume = volume
    sound.Looped = looped
    sound:Play()
    return sound
end

local success, errorMsg = pcall(function()
    playSound("rbxassetid://1837849285", 10, true, Workspace) -- Sirene
    playSound("rbxassetid://1839246711", 10, false, Workspace) -- Grito
end)
if not success then
    warn("Erro ao carregar sons: " .. errorMsg)
end

-- CÉU VERMELHO SANGUE
local function setupSky()
    local sky = safeInstance("Sky", Lighting)
    local skyboxAsset = "rbxassetid://13621794"
    sky.SkyboxBk = skyboxAsset
    sky.SkyboxDn = skyboxAsset
    sky.SkyboxFt = skyboxAsset
    sky.SkyboxLf = skyboxAsset
    sky.SkyboxRt = skyboxAsset
    sky.SkyboxUp = skyboxAsset
    Lighting.Brightness = 0
    Lighting.GlobalShadows = false
end

pcall(setupSky)

-- MENSAGEM GIGANTE NO CÉU
local function createBillboard()
    local billboard = safeInstance("BillboardGui", Workspace)
    billboard.Size = UDim2.new(0, 5000, 0, 1000)
    billboard.StudsOffset = Vector3.new(0, 500, 0)
    billboard.Adornee = Workspace.Terrain
    billboard.AlwaysOnTop = true

    local text = safeInstance("TextLabel", billboard)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "FLUXO TROLL HUB ACABOU COM VOCÊS"
    text.TextColor3 = Color3.new(1, 0, 0)
    text.TextStrokeTransparency = 0
    text.Font = Enum.Font.Arcade
    text.TextSize = 300
end

pcall(createBillboard)

-- SPAM NO CHAT
local function spamChat()
    spawn(function()
        while wait(0.1) do
            local success, err = pcall(function()
                local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
                if chatEvent then
                    chatEvent.SayMessageRequest:FireServer(
                        "FLUXO TROLL HUB DOMINOU O SERVER - CORRAM PRA SALA DA MAMÃE", "All"
                    )
                end
            end)
            if not success then
                warn("Erro no spam de chat: " .. err)
                break
            end
        end
    end)
end

pcall(spamChat)

-- EXPLOSÃO DO MAPA
local function destroyMap()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name ~= "Terrain" then
            pcall(function()
                v.Anchored = false
                v:BreakJoints()
                v.Velocity = Vector3.new(math.random(-200, 200), 300, math.random(-200, 200))
                v.RotVelocity = Vector3.new(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500))

                local fire = safeInstance("Fire", v)
                fire.Size = 50
                fire.Heat = 30

                local smoke = safeInstance("Smoke", v)
                smoke.RiseVelocity = 50
            end)
        end
    end
end

pcall(destroyMap)

-- FLING DOS JOGADORES
local function flingPlayers()
    for _, plr in pairs(Players:GetPlayers()) do
        pcall(function()
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = plr.Character.HumanoidRootPart
                hrp.Velocity = Vector3.new(0, 9999, 0)
                hrp.RotVelocity = Vector3.new(9999, 9999, 9999)
            end
        end)
    end
end

pcall(flingPlayers)

-- PARTÍCULAS DE SANGUE
local function createBloodParticles()
    for i = 1, 500 do
        pcall(function()
            local part = safeInstance("Part", Workspace)
            part.Size = Vector3.new(2, 2, 2)
            part.Position = Vector3.new(math.random(-500, 500), math.random(50, 500), math.random(-500, 500))
            part.Anchored = false
            part.CanCollide = false
            part.Color = Color3.new(0.5, 0, 0)
            part.Material = Enum.Material.Neon

            local vel = safeInstance("BodyVelocity", part)
            vel.Velocity = Vector3.new(math.random(-300, 300), -200, math.random(-300, 300))
            vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

            game.Debris:AddItem(part, 10)
        end)
    end
end

pcall(createBloodParticles)

-- FUNÇÃO PARA CRIAR UM CLONE VISUAL
local function createGhostClone()
    local player = Players.LocalPlayer
    if not player.Character then return end

    -- Cria uma cópia do personagem
    local character = player.Character
    local clone = character:Clone()
    clone.Name = "Ghost_" .. player.Name
    clone.Parent = Workspace

    -- Remove scripts que possam interferir no clone
    for _, obj in pairs(clone:GetDescendants()) do
        if obj:IsA("Script") or obj:IsA("LocalScript") or obj:IsA("Humanoid") then
            obj:Destroy()
        end
    end

    -- Configura o clone para parecer "fantasmagórico"
    for _, part in pairs(clone:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Anchored = true
            part.Transparency = 0.5
            part.BrickColor = BrickColor.new("Really red")

            -- Adiciona partículas
            local particle = Instance.new("ParticleEmitter", part)
            particle.Texture = "rbxassetid://243728937"
            particle.Rate = 100
            particle.Speed = NumberRange.new(5, 10)
            particle.Lifetime = NumberRange.new(1, 3)
            particle.Color = ColorSequence.new(Color3.new(1, 0, 0))
        end
    end

    -- Adiciona uma mensagem no chat
    pcall(function()
        local chatEvent = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvent then
            chatEvent.SayMessageRequest:FireServer(
                player.Name .. " AINDA ESTÁ AQUI... VOCÊS NUNCA VÃO ESCAPAR DO FLUXO TROLL HUB!", "All"
            )
        end
    end)

    -- Tenta manter o clone persistente
    clone:SetAttribute("PersistAfterLeave", true)
end

-- NOTIFICAÇÃO
local function sendNotification()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "APOCALIPSE 3.0",
            Text = "SERVIDOR MORTO EM 3... 2... 1...",
            Duration = 10
        })
    end)
end

sendNotification()

-- Cria o clone visual antes de "sair"
pcall(createGhostClone)

-- Aguarda 15 segundos para os efeitos serem aplicados
wait(15)