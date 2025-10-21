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
print("Hello World!")
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
local lobbyPos = Vector3.new(0, 10, 0) -- mude para a posição do lobby

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