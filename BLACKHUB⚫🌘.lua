local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()local Window = redzlib:MakeWindow({
  Title = "Black redz X: glow a Garden/murder Mystery",
  SubTitle = "by davidgames3d and friend",
  SaveFolder = "testando | redz lib v5.lua"
})Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://115007060242646", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tab1 = Window:MakeTab({"menu🏠", "house"})

Tab1:AddButton({"dark hub🐺", function(Value) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DARKHUB🐺.lua"))()
end})

Tab1:AddDiscordInvite({
    Name = "davidgames3d server",
    Description = "Join server",
    Logo = "rbxassetid://12242838336",
    Invite = "https://discord.gg/f3RqTwMy5k",
})

local Tab1 = Window:MakeTab({"murder Mystery🔪", "knife"})

Tab1:AddButton({"Moondiety", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-KEYLESS-InstaWin-AutoFarm-Kill-all-XRay-nd-more-by-Moondiety-48644"))()
print("Hello World!")
end})

Tab1:AddButton({"BEST OP FARM GUI UNDECTED", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-BEST-OP-FARM-GUI-UNDETECTED-56081"))()
print("Hello World!")
end})

Tab1:AddButton({"beachball farm", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-beachball-farm-45402"))()
print("Hello World!")
end})

Tab1:AddButton({"Polaris Hub 30 more", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-Polaris-Hub-30-More-Features-42344"))()
print("Hello World!")
end})

Tab1:AddButton({"AtherHub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Murder-Mystery-2-AtherHub-17204"))()
print("Hello World!")
end})

Tab1:AddButton({"auto candies farm", function(Value)
loadstring(game:HttpGet("https://pastefy.app/LlkfAKqJ/raw"))()
print("Hello World!")
end})

local teleportando = false -- variável de controle
local lobbyPos = Vector3.new(-4994.08, 309.75,18.06) -- mude para a posição do lobby

Tab1:AddToggle({
    Name = "TELEPORTAR PARA O LOBBY",
    Default = false,
    Callback = function(v)
        teleportando = v

        if teleportando then
            task.spawn(function()
                local player = game.Players.LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()

                -- Enquanto o toggle estiver ativado, teleporta sem parar
                while teleportando do
                    -- Atualiza a referência do personagem
                    char = player.Character or player.CharacterAdded:Wait()

                    -- Teleporta
                    if char:FindFirstChild("HumanoidRootPart") then
                        char:MoveTo(lobbyPos)
                    end

                    -- Espera um pouco antes de teleportar de novo (evita crash)
                    task.wait(1)
                end
            end)
        end
    end
})

local Toggle1 = Tab1:AddToggle({
    Name = "SPY PLAYERS",
    Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
    Default = false 
})

-- Função para criar a hitbox ou marcador
local function createMarker(player)
    if player.Character and not player.Character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "Highlight"
        highlight.Adornee = player.Character
        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- cor do hitbox
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    end
end

-- Função para remover marcador
local function removeMarker(player)
    if player.Character and player.Character:FindFirstChild("Highlight") then
        player.Character.Highlight:Destroy()
    end
end

Toggle1:Callback(function(Value)
    local Players = game:GetService("Players")
    
    if Value then
        -- Adiciona hitbox para todos os jogadores
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer then
                createMarker(player)
            end
        end

        -- Detecta novos jogadores que entrarem
        Players.PlayerAdded:Connect(function(player)
            if player ~= Players.LocalPlayer then
                createMarker(player)
            end
        end)
    else
        -- Remove todos os highlights
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer then
                removeMarker(player)
            end
        end
    end
end)

local Tab1 = Window:MakeTab({"glow a GARDEN🌼", "main"})

Tab1:AddButton({"glow a garden Farm UPDATE", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-KEYLESS-Grow-a-garden-INFINITE-MONEY-DUPE-auto-farm-script-41396"))()
print("Hello World!")
end})

Tab1:AddButton({"forge hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-Forge-Hub-41363"))()
print("Hello World!")
end})

Tab1:AddButton({"Neox hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-Neox-Hub-41972"))()
print("Hello World!")
end})

Tab1:AddButton({"ZapHub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-The-Best-GAG-Script-ZapHub-Keyless-51562"))()
print("Hello World!")
end})

Tab1:AddButton({"Lumix", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-SEE-WHAT-PETS-BEFORE-HATCHING-OP-41901"))()
print("Hello World!")
end})

Tab1:AddButton({"eF Hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-eF-Hub-45212"))()
print("Hello World!")
end})

Tab1:AddButton({"Stock bot", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-Grow-a-Garden-Stock-bot-41500"))()
print("Hello World!")
end})

Tab1:AddButton({"Freeze All Pets", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-Freeze-All-Pets-43750"))()
print("Hello World!")
end})

Tab1:AddButton({"Blackhub sheckles", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Grow-a-Garden-Blackhub-Infinite-Sheckles-41369"))()
print("Hello World!")
end})