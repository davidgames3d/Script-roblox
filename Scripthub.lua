-- Hub completo com menu mobile e funções básicas

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Cria ScreenGui para o menu
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HackHubGui"
screenGui.Parent = PlayerGui

-- Tabela Hub com funções
local Hub = {}

-- SpeedHack
function Hub.SpeedHack(enable)
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        if enable then
            char.Humanoid.WalkSpeed = 50
        else
            char.Humanoid.WalkSpeed = 16
        end
    end
end

-- JumpHack
function Hub.JumpHack(enable)
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        if enable then
            char.Humanoid.JumpPower = 100
        else
            char.Humanoid.JumpPower = 50
        end
    end
end

-- Teleport para uma posição fixa (exemplo: posição do spawn)
function Hub.Teleport()
    local char = player.Character
    local spawn = workspace:FindFirstChild("SpawnLocation")
    if char and spawn and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = spawn.CFrame + Vector3.new(0,5,0)
    end
end

-- ESP básico: marca os players com BillboardGui
function Hub.ESP(enable)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= player then
            local char = p.Character
            if char and char:FindFirstChild("Head") then
                local head = char.Head
                local espTag = head:FindFirstChild("ESP_Tag")
                if enable then
                    if not espTag then
                        espTag = Instance.new("BillboardGui", head)
                        espTag.Name = "ESP_Tag"
                        espTag.Adornee = head
                        espTag.Size = UDim2.new(0,100,0,50)
                        espTag.AlwaysOnTop = true

                        local text = Instance.new("TextLabel", espTag)
                        text.Size = UDim2.new(1,0,1,0)
                        text.BackgroundTransparency = 1
                        text.TextColor3 = Color3.new(1,0,0)
                        text.TextStrokeTransparency = 0
                        text.Text = p.Name
                    end
                else
                    if espTag then
                        espTag:Destroy()
                    end
                end
            end
        end
    end
end

-- Spy básico: printa no console ações de outros players (exemplo de entrada na workspace)
function Hub.Spy(enable)
    if enable then
        print("Spy ativado! Monitorando players...")

        -- Exemplo: quando um player adiciona um personagem
        Players.PlayerAdded:Connect(function(plr)
            print(plr.Name .. " entrou no jogo!")
        end)

        -- Você pode adicionar outros eventos para monitorar ações específicas
    else
        print("Spy desativado!")
        -- Para desativar, teria que desconectar os eventos, aqui é só um exemplo simples
    end
end

-- Função para criar botões no menu
local function createButton(name, position, size, text)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50,50,50)
    button.TextColor3 = Color3.new(1,1,1)
    button.Text = text
    button.Font = Enum.Font.SourceSansBold
    button.TextScaled = true
    button.Parent = screenGui
    return button
end

-- Criar botões do menu
local btnSpeed = createButton("SpeedHackBtn", UDim2.new(0,10,0,10), UDim2.new(0,150,0,50), "SpeedHack OFF")
local btnJump = createButton("JumpHackBtn", UDim2.new(0,10,0,70), UDim2.new(0,150,0,50), "JumpHack OFF")
local btnESP = createButton("ESPBtn", UDim2.new(0,10,0,130), UDim2.new(0,150,0,50), "ESP OFF")
local btnTeleport = createButton("TeleportBtn", UDim2.new(0,10,0,190), UDim2.new(0,150,0,50), "Teleport")
local btnSpy = createButton("SpyBtn", UDim2.new(0,10,0,250), UDim2.new(0,150,0,50), "Spy OFF")

-- Estados dos hacks
local speedOn = false
local jumpOn = false
local espOn = false
local spyOn = false

-- Funções para ativar/desativar hacks pelo menu
local function toggleSpeed()
    speedOn = not speedOn
    Hub.SpeedHack(speedOn)
    btnSpeed.Text = speedOn and "SpeedHack ON" or "SpeedHack OFF"
end

local function toggleJump()
    jumpOn = not jumpOn
    Hub.JumpHack(jumpOn)
    btnJump.Text = jumpOn and "JumpHack ON" or "JumpHack OFF"
end

local function toggleESP()
    espOn = not espOn
    Hub.ESP(espOn)
    btnESP.Text = espOn and "ESP ON" or "ESP OFF"
end

local function doTeleport()
    Hub.Teleport()
end

local function toggleSpy()
    spyOn = not spyOn
    Hub.Spy(spyOn)
    btnSpy.Text = spyOn and "Spy ON" or "Spy OFF"
end

-- Conectar botões aos eventos de toque/clique
btnSpeed.MouseButton1Click:Connect(toggleSpeed)
btnJump.MouseButton1Click:Connect(toggleJump)
btnESP.MouseButton1Click:Connect(toggleESP)
btnTeleport.MouseButton1Click:Connect(doTeleport)
btnSpy.MouseButton1Click:Connect(toggleSpy)
