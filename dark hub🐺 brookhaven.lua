local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
  Title = "dark hub🐺 : brookhaven RP🏡",
  SubTitle = "by davidgames3d",
  SaveFolder = "testando | redz lib v5.lua"
})
local Tab1 = Window:MakeTab({"main🏡", "main"})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://9265687294", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

Tab1:AddDiscordInvite({
    Name = "davidgames3d server",
    Description = "Junte-se a nós",
    Logo = "rbxassetid://6604011398",
    Invite = "https://discord.gg/qXkvYQYKZG",
})

local Paragraph = Tab1:AddParagraph({"aviso", "essa é a versão \para brookhaven do dark hub"})

  local Dialog = Window:Dialog({
    Title = "bem-vindo(a)",
    Text = "essa é uma versão para brookhaven do dark hub criada por david",
    Options = {
      {"continuar", function()
        
      end},
      {"obrigado", function()
        
      end},
      {"Cancelar", function()
        
      end}
    }
  })

Tab1:AddButton({"dark hub🐺 original", function(Value) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DARKHUB🐺.lua"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"scripts", "utility"})

Tab1:AddButton({"zynora hub", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/PwyJLxeJ"))()
print("Hello World!")
end})

Tab1:AddButton({"soluna 1.1.0", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua",true))()
print("Hello World!")
end})

Tab1:AddButton({"script no key", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/LCmR8qkj"))()
print("Hello World!")
end})

Tab1:AddButton({"FHub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"system admin", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Cat558-uz/IntTeste/refs/heads/main/N9999"))()
print("Hello World!")
end})

Tab1:AddButton({"MangoHub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/rogelioajax/lua/main/MangoHub", true))
print("Hello World!")
end})

Tab1:AddButton({"salvatore hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/RFR-R1CH4RD/Loader/main/Salvatore.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"SP Hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/Brookhaven"))()
print("Hello World!")
end})

Tab1:AddButton({"Chaos Hub V1", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/58jNvV3h"))()
print("Hello World!")
end})

Tab1:AddButton({"Real Hub", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/EYs5T7Yg",true))()
print("Hello World!")
end})

Tab1:AddButton({"all scripts hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/ScriptBrv/BROKEY/refs/heads/main/BROKEY.md",true))()
print("Hello World!")
end})

Tab1:AddButton({"station hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Alexcirer/Alexcirer/refs/heads/main/Station"))()
print("Hello World!")
end})

Tab1:AddButton({"Sander XY", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"Cartola Hub🎩", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))() 
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"trollagem🤣", "trollface"})

-- Variável pra guardar o Sky
local sky

-- Caixa de texto pra colocar o ID
local skyboxID
Tab1:AddTextBox({
    Name = "ID da Sky Box",
    Description = "Digite o ID da T-Shirt ou outro Skybox",
    PlaceholderText = "rbxassetid aqui",
    Callback = function(Value)
        skyboxID = Value -- salva o valor digitado
    end
})

-- Toggle pra ativar/desativar o Sky Box
local Toggle1 = Tab1:AddToggle({
    Name = "Ativar Sky Box",
    Description = "Ativa ou desativa o Sky Box usando o ID da caixa de texto ou a T-Shirt do player",
    Default = false
})

Toggle1:Callback(function(Value)
    if Value then
        local idToUse = skyboxID -- primeiro tenta usar o ID digitado
        -- se a caixa estiver vazia, tenta pegar a T-Shirt do player
        if not idToUse or idToUse == "" then
            local shirt = player.Character and player.Character:FindFirstChildOfClass("Shirt")
            if shirt then
                idToUse = shirt.ShirtTemplate:match("%d+")
            end
        end

        if idToUse and idToUse ~= "" then
            if sky then sky:Destroy() end
            sky = Instance.new("Sky")
            sky.Name = "SkyBoxCustom"
            for _,prop in ipairs({"SkyboxBk","SkyboxDn","SkyboxFt","SkyboxLf","SkyboxRt","SkyboxUp"}) do
                sky[prop] = "rbxassetid://"..idToUse
            end
            sky.Parent = game.Lighting
            criarNotificacao("Sky Box", "Sky Box ativado com o ID: "..idToUse, 3)
        else
            criarNotificacao("Erro", "Não foi possível pegar nenhum ID válido!", 3)
        end
    else
        -- Desativar Sky Box
        if sky then
            sky:Destroy()
            sky = nil
            criarNotificacao("Sky Box", "Sky Box removido!", 3)
        end
    end
end)

local Tab1 = Window:MakeTab({"PLAYERS", "eye"})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- pega todos os jogadores
local function GetPlayersList()
    local names = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        table.insert(names, plr.Name)
    end
    return names
end

local SelectedPlayer = nil
local Spectating = false

-- Dropdown com os jogadores
local Dropdown = Tab1:AddDropdown({
    Name = "Players List",
    Description = "Select the <font color='rgb(88, 101, 242)'>Player</font>",
    Options = GetPlayersList(),
    Default = LocalPlayer.Name,
    Flag = "dropdown teste",
    Callback = function(Value)
        SelectedPlayer = Players:FindFirstChild(Value)
    end
})

-- Toggle para spectar
Tab1:AddToggle({
    Name = "Spectate Player",
    Default = false,
    Callback = function(v)
        Spectating = v
        if not v then
            -- volta pro player local
            Camera.CameraSubject = LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        elseif SelectedPlayer and SelectedPlayer.Character then
            -- segue o player selecionado
            local hum = SelectedPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            if hum then
                Camera.CameraSubject = hum
            end
        end
    end
})

-- atualiza dropdown quando jogadores entram ou saem
Players.PlayerAdded:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)
Players.PlayerRemoving:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)

-- se o jogador selecionado morrer/respawnar e ainda estiver spectando, a câmera continua nele
game:GetService("RunService").RenderStepped:Connect(function()
    if Spectating and SelectedPlayer and SelectedPlayer.Character then
        local hum = SelectedPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        if hum and Camera.CameraSubject ~= hum then
            Camera.CameraSubject = hum
        end
    end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- pega todos os jogadores
local function GetPlayersList()
    local names = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        table.insert(names, plr.Name)
    end
    return names
end

local SelectedPlayer = nil

-- Dropdown com os jogadores
local Dropdown = Tab1:AddDropdown({
    Name = "Players List",
    Description = "Select the <font color='rgb(88, 101, 242)'>Player</font>",
    Options = GetPlayersList(),
    Default = LocalPlayer.Name,
    Flag = "dropdown teste",
    Callback = function(Value)
        SelectedPlayer = Players:FindFirstChild(Value)
    end
})

-- Botão para teleportar
Tab1:AddButton({"Teleport to Player", function()
    if SelectedPlayer and SelectedPlayer.Character then
        local myChar = LocalPlayer.Character
        local targetChar = SelectedPlayer.Character
        local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")

        if targetHRP and myHRP then
            -- teleporta direto no jogador (3 studs acima pra não bugar dentro dele)
            myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 3, 0)
        end
    end
end})

-- Atualiza lista de jogadores quando entra/sai alguém
Players.PlayerAdded:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)
Players.PlayerRemoving:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local SelectedPlayer = nil

-- função para listar jogadores
local function GetPlayersList()
    local names = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        table.insert(names, plr.Name)
    end
    return names
end

-- Dropdown com os jogadores
local Dropdown = Tab1:AddDropdown({
    Name = "Players List",
    Description = "Select a <font color='rgb(255, 50, 50)'>Player</font>",
    Options = GetPlayersList(),
    Default = LocalPlayer.Name,
    Flag = "dropdown_fling",
    Callback = function(Value)
        SelectedPlayer = Players:FindFirstChild(Value)
    end
})

-- Botão para spawnar a bolinha troll
Tab1:AddButton({"Spawn Troll Ball", function()
    if SelectedPlayer and SelectedPlayer.Character then
        local hrp = SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            -- cria a bolinha
            local ball = Instance.new("Part")
            ball.Shape = Enum.PartType.Ball
            ball.Size = Vector3.new(5,5,5)
            ball.Position = hrp.Position + Vector3.new(0, 5, 0)
            ball.Anchored = false
            ball.CanCollide = true
            ball.Color = Color3.fromRGB(255,0,0)
            ball.Parent = workspace

            -- força que faz a bola seguir o player
            local bp = Instance.new("BodyPosition")
            bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            bp.P = 1e9
            bp.D = 0
            bp.Position = hrp.Position
            bp.Parent = ball

            -- loop pra bola perseguir o jogador
            RunService.Heartbeat:Connect(function()
                if hrp and bp.Parent and ball.Parent then
                    bp.Position = hrp.Position
                end
            end)
        end
    end
end})

-- atualiza a lista se players entrarem/sair
Players.PlayerAdded:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)
Players.PlayerRemoving:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local GuiService = LocalPlayer:WaitForChild("PlayerGui")

local SelectedPlayer = nil

-- Função pra mostrar mensagem na tela
local function ShowMessage(text)
    local msg = Instance.new("TextLabel")
    msg.Size = UDim2.new(0.5,0,0.1,0)
    msg.Position = UDim2.new(0.25,0,0.9,0)
    msg.BackgroundTransparency = 0.5
    msg.TextScaled = true
    msg.Text = text
    msg.Parent = GuiService

    game:GetService("Debris"):AddItem(msg, 3)
end

-- Função pra achar a bola de um jogador
local function FindPlayerBall(player)
    if not player.Character then return nil end
    local char = player.Character

    -- 1) Bola jogada / no mundo
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "SoccerBall" and obj:IsA("Part") then
            return obj
        end
    end

    -- 2) Bola na mão do player (equipada)
    for _, item in ipairs(char:GetDescendants()) do
        if item.Name == "SoccerBall" and item:IsA("Part") then
            return item
        end
    end

    -- 3) Bola no inventário do LocalPlayer (aqui você precisaria de acesso ao inventário real do jogo)
    -- placeholder: se não achar nada, retorna nil
    return nil
end

-- Dropdown de jogadores
local function GetPlayersList()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        table.insert(t, p.Name)
    end
    return t
end

local Dropdown = Tab1:AddDropdown({
    Name = "Players List",
    Description = "Escolha a vítima",
    Options = GetPlayersList(),
    Default = LocalPlayer.Name,
    Flag = "dropdown_fling",
    Callback = function(Value)
        SelectedPlayer = Players:FindFirstChild(Value)
    end
})

Players.PlayerAdded:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)
Players.PlayerRemoving:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)

-- Botão para ativar o caos físico
Tab1:AddButton({"Spawn Troll Ball", function()
    if not SelectedPlayer then
        ShowMessage("Selecione um player primeiro!")
        return
    end

    local ball = FindPlayerBall(SelectedPlayer)

    if not ball then
        ShowMessage("Não há bola disponível para esse player!")
        return
    end

    local hrp = SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then
        ShowMessage("Player não tem personagem ativo!")
        return
    end

    -- aplica BodyPosition pra colar no jogador
    local bp = Instance.new("BodyPosition")
    bp.MaxForce = Vector3.new(1e9,1e9,1e9)
    bp.P = 1e6
    bp.D = 0
    bp.Position = hrp.Position
    bp.Parent = ball

    -- loop pra atualizar posição
    local conn
    conn = RunService.Heartbeat:Connect(function()
        if not hrp or not ball.Parent then
            conn:Disconnect()
            return
        end
        bp.Position = hrp.Position
    end)
end})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local SelectedPlayer = nil
local OriginalPosition = nil
local Teleporting = false

-- Função para equipar o sofá
local function equipCouch()
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if not backpack then return nil end

    local couchItem = backpack:FindFirstChild("Couch")
    if couchItem then
        couchItem.Parent = LocalPlayer.Character
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:EquipTool(couchItem)
            return couchItem
        end
    end
    return nil
end

-- Dropdown de jogadores
local function GetPlayersList()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        table.insert(t, p.Name)
    end
    return t
end

local Dropdown = Tab1:AddDropdown({
    Name = "Players List",
    Description = "Escolha o alvo",
    Options = GetPlayersList(),
    Default = LocalPlayer.Name,
    Flag = "dropdown_sofablink",
    Callback = function(Value)
        SelectedPlayer = Players:FindFirstChild(Value)
    end
})

Players.PlayerAdded:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)
Players.PlayerRemoving:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)

-- Botão do sofá-blink
Tab1:AddButton({"Sofa Blink", function()
    if not SelectedPlayer or not SelectedPlayer.Character then return end
    local hrpTarget = SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")
    local humanoidTarget = SelectedPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not hrpTarget or not humanoidTarget then return end

    local couch = equipCouch()
    if not couch then return end

    -- Salva posição original
    OriginalPosition = LocalPlayer.Character.HumanoidRootPart.CFrame

    Teleporting = true
    local conn
    conn = RunService.Heartbeat:Connect(function()
        if not Teleporting then
            conn:Disconnect()
            return
        end

        local hrpPlayer = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrpPlayer then
            -- Teleporta você + sofá pra perto do alvo
            local targetPos = hrpTarget.Position + Vector3.new(0,0,2) -- fica a 2 studs de distância
            hrpPlayer.CFrame = CFrame.new(targetPos)
            couch.CFrame = hrpPlayer.CFrame * CFrame.new(0, -3, 0) -- sofá no chão perto dos pés

            -- Faz o player alvo sentar se próximo do sofá
            local dist = (couch.Position - hrpTarget.Position).Magnitude
            if dist <= 4 then
                humanoidTarget.Sit = true
                -- Assim que sentar, teleportamos de volta
                Teleporting = false
                hrpPlayer.CFrame = OriginalPosition
                couch.CFrame = OriginalPosition * CFrame.new(0, -3, 0)
            end
        end
    end)
end})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SelectedPlayer = nil

-- Função pra atualizar lista de jogadores
local function GetPlayersList()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        table.insert(t, p.Name)
    end
    return t
end

-- Dropdown de players
local Dropdown = Tab1:AddDropdown({
    Name = "Choose Player",
    Description = "Select a player to copy skin",
    Options = GetPlayersList(),
    Default = LocalPlayer.Name,
    Flag = "skin_copy_dropdown",
    Callback = function(Value)
        SelectedPlayer = Players:FindFirstChild(Value)
    end
})

Players.PlayerAdded:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)
Players.PlayerRemoving:Connect(function()
    Dropdown:SetOptions(GetPlayersList())
end)

-- Função pra copiar skin
local function CopySkin(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetChar = targetPlayer.Character
    local myChar = LocalPlayer.Character
    if not myChar then return end

    -- Copiar BodyColors (cor da pele, olhos, cabelo)
    local targetColors = targetChar:FindFirstChild("Body Colors") or targetChar:FindFirstChild("BodyColors")
    if targetColors then
        local myColors = myChar:FindFirstChild("Body Colors") or Instance.new("BodyColors", myChar)
        for _, prop in ipairs({"HeadColor", "TorsoColor", "LeftArmColor", "RightArmColor", "LeftLegColor", "RightLegColor"}) do
            if targetColors[prop] then
                myColors[prop] = targetColors[prop]
            end
        end
    end

    -- Copiar Shirt
    local targetShirt = targetChar:FindFirstChildOfClass("Shirt")
    if targetShirt then
        local myShirt = myChar:FindFirstChildOfClass("Shirt") or Instance.new("Shirt", myChar)
        myShirt.ShirtTemplate = targetShirt.ShirtTemplate
    end

    -- Copiar Pants
    local targetPants = targetChar:FindFirstChildOfClass("Pants")
    if targetPants then
        local myPants = myChar:FindFirstChildOfClass("Pants") or Instance.new("Pants", myChar)
        myPants.PantsTemplate = targetPants.PantsTemplate
    end

    -- Copiar Accessories
    for _, acc in ipairs(myChar:GetChildren()) do
        if acc:IsA("Accessory") then
            acc:Destroy()
        end
    end
    for _, acc in ipairs(targetChar:GetChildren()) do
        if acc:IsA("Accessory") then
            local newAcc = acc:Clone()
            newAcc.Parent = myChar
        end
    end
end

-- Botão do hub
Tab1:AddButton({"Copy Skin", function()
    if SelectedPlayer then
        CopySkin(SelectedPlayer)
    end
end})

local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

local RGBToggle = false
local RGBSpeed = 0.1 -- tempo entre atualizações (segundos)

Tab1:AddToggle({
    Name = "RGB Mode",
    Default = false,
    Callback = function(v)
        RGBToggle = v
    end
})

local function RandomColor()
    return Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
end

-- Loop contínuo pra atualizar cores
spawn(function()
    while true do
        wait(RGBSpeed)
        if RGBToggle and LocalPlayer.Character then
            local bodyColors = LocalPlayer.Character:FindFirstChild("Body Colors") 
                               or Instance.new("BodyColors", LocalPlayer.Character)
            bodyColors.HeadColor = RandomColor()
            bodyColors.TorsoColor = RandomColor()
            bodyColors.LeftArmColor = RandomColor()
            bodyColors.RightArmColor = RandomColor()
            bodyColors.LeftLegColor = RandomColor()
            bodyColors.RightLegColor = RandomColor()
        end
    end
end)

Tab1:AddButton({"c00lkidd hub a Key é C00LKIDDMAN666", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/c00lkiddHUB.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"SHNMAX", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-SHNMAX-UPDATE-FIX-NO-KEYLESS-48289"))()
print("Hello World!")
end})

Tab1:AddButton({"fling all", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
print("Hello World!")
end})