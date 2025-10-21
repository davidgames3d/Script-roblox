-- LocalScript (colocar em StarterPlayerScripts)
-- Usa clones locais para não alterar o servidor.
-- Toggle: tecla "P"

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- CONFIGURÁVEL
local ORBIT_TAG = "OrbitMe" -- se você quiser taggear peças no mapa: dê Name="OrbitMe" ou mude lógica abaixo
local MAX_OBJECTS = 50      -- número máximo de objetos que vão orbitar
local RADIUS = 200            -- raio do orbit (está em studs)
local ANGULAR_SPEED = math.pi * 0.8 -- velocidade angular (rad/s)
local VERTICAL_OSC = 1.2    -- amplitude vertical (pequena oscilação)
local FOOT_BLOCK_SIZE = Vector3.new(3, 0.6, 3) -- tamanho do bloco embaixo dos pés
local FOOT_BLOCK_HEIGHT_OFFSET = -3.5 -- distância vertical abaixo do HRP para posicionar os blocos
local FOOT_BLOCK_Y_BUFFER = 0.2 -- evita z-fighting

-- internals
local active = false
local clones = {} -- tabela de clones que orbitam
local angle = 0
local connection = nil
local footBlocks = {} -- dois blocos (ou só um) para segurar os pés

-- utility: pega partes do mapa que você quer que orbitem
local function findMapParts()
    local found = {}
    -- Opção 1: procurar por Name == ORBIT_TAG (fácil de marcar no mapa)
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == ORBIT_TAG then
            table.insert(found, obj)
            if #found >= MAX_OBJECTS then break end
        end
    end

    -- Se não encontrou nada, pega algumas partes aleatórias seguras (não muito grandes)
    if #found == 0 then
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and not obj:IsDescendantOf(character) and obj.CanCollide and obj.Size.Magnitude < 50 then
                table.insert(found, obj)
                if #found >= MAX_OBJECTS then break end
            end
        end
    end

    return found
end

-- cria clones locais (Anchored, CanCollide false) para orbitar
local function createClones(parts)
    clones = {}
    for i, part in ipairs(parts) do
        local ok, clone = pcall(function()
            local c = part:Clone()
            c.Parent = workspace -- manter no workspace para ser renderizado localmente
            c.CanCollide = false
            c.Anchored = true
            -- diminuir transparência se desejar (comente se quiser igual)
            -- c.Transparency = math.clamp((i-1)/#parts, 0, 0.6)
            return c
        end)
        if ok and clone then
            table.insert(clones, clone)
        end
    end
end

-- limpa clones e blocos
local function cleanup()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    for _, c in ipairs(clones) do
        if c and c.Parent then
            c:Destroy()
        end
    end
    clones = {}
    for _, b in ipairs(footBlocks) do
        if b and b.Parent then b:Destroy() end
    end
    footBlocks = {}
    active = false
end

-- cria blocos sob os pés (um para cada pé ou apenas um central)
local function createFootBlocks()
    -- bloco central sob o HRP (funciona bem)
    local block = Instance.new("Part")
    block.Size = FOOT_BLOCK_SIZE
    block.Anchored = true
    block.CanCollide = true -- se quiser impedir cair, deixar true
    block.Material = Enum.Material.Plastic
    block.Name = "FootBlock_Local"
    block.Parent = workspace
    block.TopSurface = Enum.SurfaceType.Smooth
    block.BottomSurface = Enum.SurfaceType.Smooth
    table.insert(footBlocks, block)

    -- opcional: segundo bloco para efeito visual (descomente se quiser dois blocos)
    --[[
    local block2 = block:Clone()
    block2.Parent = workspace
    table.insert(footBlocks, block2)
    --]]
end

-- atualiza posição dos blocos sob os pés
local function updateFootBlocks()
    if not hrp or #footBlocks == 0 then return end
    local pos = hrp.Position
    local baseY = pos.Y + FOOT_BLOCK_HEIGHT_OFFSET
    -- bloco central:
    local b = footBlocks[1]
    if b then
        local target = Vector3.new(pos.X, baseY - FOOT_BLOCK_Y_BUFFER, pos.Z)
        b.CFrame = CFrame.new(target) * CFrame.Angles(0, hrp.Orientation.Y * math.pi/180, 0)
    end
    -- se tiver segundo bloco, posicione levemente deslocado
    if footBlocks[2] then
        local offset = hrp.CFrame.RightVector * 2
        local target2 = Vector3.new(pos.X, baseY - FOOT_BLOCK_Y_BUFFER, pos.Z) + offset
        footBlocks[2].CFrame = CFrame.new(target2)
    end
end

-- loop que faz os clones orbitarem
local function startOrbitLoop()
    angle = 0
    local count = #clones
    if count == 0 then return end

    connection = RunService.RenderStepped:Connect(function(dt)
        if not active then return end
        if not character or not hrp.Parent then
            cleanup()
            return
        end

        angle = angle + ANGULAR_SPEED * dt

        for i, clone in ipairs(clones) do
            if clone and clone.Parent then
                local t = (i-1)/count
                local theta = angle + t * (2*math.pi)
                local x = math.cos(theta) * RADIUS
                local z = math.sin(theta) * RADIUS
                local y = math.sin(angle * 0.9 + t*2*math.pi) * VERTICAL_OSC + 2 -- eleva um pouco acima do chão
                local offset = Vector3.new(x, y, z)
                local worldPos = hrp.Position + offset
                clone.CFrame = CFrame.new(worldPos) * CFrame.Angles(0, theta, 0)
            end
        end

        -- manter blocos sob os pés
        updateFootBlocks()
    end)
end

-- ativa ou desativa tudo
local function setActive(on)
    if on then
        if active then return end
        active = true
        character = player.Character or player.CharacterAdded:Wait()
        hrp = character:WaitForChild("HumanoidRootPart")

        -- pegar partes do mapa
        local parts = findMapParts()
        createClones(parts)
        createFootBlocks()
        startOrbitLoop()
    else
        cleanup()
    end
end

-- Toggle por tecla "P"
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.P then
        setActive(not active)
    end
end)

-- Opcional: auto ligar ao spawn (comente se não quiser)
-- setActive(true)

-- Garantia de limpeza se o personagem morrer/respawna
player.CharacterRemoving:Connect(function()
    cleanup()
end)