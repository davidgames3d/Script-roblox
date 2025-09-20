-- Backrooms Labirinto com Entidade Sombria
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local backrooms = Instance.new("Model")
backrooms.Name = "LocalBackrooms"
backrooms.Parent = workspace

-- Som ambiente
local hum = Instance.new("Sound")
hum.SoundId = "rbxassetid://9120782694" -- som de lâmpada
hum.Looped = true
hum.Volume = 0.5
hum.Parent = hrp
hum:Play()

-- Função para criar sala
local function criarSala(pos)
    local sala = Instance.new("Model")
    sala.Parent = backrooms

    local floor = Instance.new("Part")
    floor.Size = Vector3.new(50,1,50)
    floor.Position = pos
    floor.Anchored = true
    floor.BrickColor = BrickColor.new("Cool yellow")
    floor.Material = Enum.Material.Concrete
    floor.Parent = sala

    local ceiling = floor:Clone()
    ceiling.Position = pos + Vector3.new(0,10,0)
    ceiling.Parent = sala

    local light = Instance.new("PointLight", ceiling)
    light.Range = 30
    light.Brightness = 2
    light.Color = Color3.fromRGB(255, 255, 200)

    -- piscadas de luz
    task.spawn(function()
        while sala.Parent do
            task.wait(math.random(5,15))
            for i = 1,3 do
                light.Enabled = false
                task.wait(0.2)
                light.Enabled = true
                task.wait(0.1)
            end
        end
    end)

    -- paredes
    local offsets = {
        Vector3.new(25,5,0),
        Vector3.new(-25,5,0),
        Vector3.new(0,5,25),
        Vector3.new(0,5,-25)
    }

    for _,offset in ipairs(offsets) do
        local wall = Instance.new("Part")
        wall.Size = Vector3.new(1,10,50)
        if math.abs(offset.Z) > 0 then
            wall.Size = Vector3.new(50,10,1)
        end
        wall.Position = pos + offset
        wall.Anchored = true
        wall.BrickColor = BrickColor.new("Cool yellow")
        wall.Material = Enum.Material.Concrete
        wall.Parent = sala

        -- portal invisível
        local portal = Instance.new("Part")
        portal.Size = Vector3.new(5,7,1)
        portal.CanCollide = false
        portal.Anchored = true
        portal.Transparency = 1
        portal.CFrame = wall.CFrame + (wall.CFrame.LookVector * -0.5)
        portal.Parent = sala

        portal.Touched:Connect(function(hit)
            if hit.Parent == char then
                if math.random(1,100) <= 5 then
                    hrp.CFrame = CFrame.new(workspace.SpawnLocation.Position + Vector3.new(0,5,0))
                    hum:Stop()
                    backrooms:Destroy()
                else
                    criarSala(pos + offset*2)
                    hrp.CFrame = hrp.CFrame + offset*2
                end
            end
        end)
    end
end

-- Sons estranhos aleatórios
task.spawn(function()
    while backrooms.Parent do
        task.wait(math.random(10,25))
        local sound = Instance.new("Sound")
        local sons = {
            "rbxassetid://9118823102", -- passos distantes
            "rbxassetid://138081500", -- sussurro
        }
        sound.SoundId = sons[math.random(1,#sons)]
        sound.Volume = 0.6
        sound.Parent = hrp
        sound:Play()
        game.Debris:AddItem(sound, 5)
    end
end)

-- Entidade sombria (creepy)
task.spawn(function()
    while backrooms.Parent do
        task.wait(math.random(30,60)) -- chance de aparecer
        local entity = Instance.new("Part")
        entity.Size = Vector3.new(2,6,1)
        entity.Anchored = true
        entity.CanCollide = false
        entity.Color = Color3.new(0,0,0)
        entity.Material = Enum.Material.SmoothPlastic
        entity.Position = hrp.Position + Vector3.new(math.random(-20,20),3,math.random(-20,20))
        entity.Parent = backrooms

        -- brilho vermelho nos "olhos"
        local eye1 = Instance.new("PointLight", entity)
        eye1.Color = Color3.new(1,0,0)
        eye1.Brightness = 2
        eye1.Range = 4
        local eye2 = eye1:Clone()
        eye2.Parent = entity
        eye1.Position = Vector3.new(-0.5,2,0)
        eye2.Position = Vector3.new(0.5,2,0)

        -- desaparecer se player chegar perto
        task.spawn(function()
            while entity.Parent do
                task.wait(0.1)
                if (hrp.Position - entity.Position).Magnitude < 8 then
                    entity:Destroy()
                end
            end
        end)

        game.Debris:AddItem(entity, 10) -- desaparece sozinho depois de 10s
    end
end)

-- Spawn inicial
criarSala(Vector3.new(0,0,0))
hrp.CFrame = CFrame.new(0,3,0)