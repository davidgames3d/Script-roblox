local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
  Title = "dark hub parte 2: Universal",
  SubTitle = "by davidgames3d",
  SaveFolder = "testando | redz lib v5.lua"
})
local Tab1 = Window:MakeTab({"main", "main"})

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

local Paragraph = Tab1:AddParagraph({"aviso", "essa é a parte 2 do hub eu fiz\ isso por que o Github não aguenta script grande"})

Tab1:AddButton({"voltar para parte 1", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DARKHUB🐺.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"ir para parte 3", function(Value) 

print("Hello World!")
end})

local Tab1 = Window:MakeTab({"AUTO FARM,AIMBOT,SPY", "AUTO FARM,AIMBOT,SPY"})

Tab1:AddButton({"OP Infinite Stamina Auto Hunt Players Auto Farm", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/sak/refs/heads/main/for"))()
print("Hello World!")
end})

Tab1:AddButton({"OP SCRIPT KILL AURA AUTO RAID AUTO DUNGEON AND MORE", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/sh/refs/heads/main/a"))()
print("Hello World!")
end})

Tab1:AddButton({"OP Fast Kill Aura Auto Hatch Auto Roll Auto Farm", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/sh/refs/heads/main/a"))()
print("Hello World!")
end})

Tab1:AddButton({"battleground", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/THE-strongest-battleground/refs/heads/main/HOKALAZA%20The%20strongest%20battleground"))()
print("Hello World!")
end})

Tab1:AddButton({"The Strongest Battlegrounds", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/hehehe9028/THE-strongest-battleground/refs/heads/main/HOKALAZA%20The%20strongest%20battleground"))()
print("Hello World!")
end})

Tab1:AddButton({"Fish Key Lessa script", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/KoonpeatchRE/Lonely_Hub/refs/heads/main/Fish_It"))()
print("Hello World!")
end})

Tab1:AddButton({"esp and hitbox expander", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/EnesKam21/deadlineesp/refs/heads/main/deadlineesp.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"rainbow script", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/ArceusXArchivezx/Game/refs/heads/main/ArceusXArchive"))()
print("Hello World!")
end})

Tab1:AddButton({"knockout simulator", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Matej1912/Knockout-Simulator/refs/heads/main/Script"))()
print("Hello World!")
end})

Tab1:AddButton({"insta kill", function(Value)
loadstring(game:HttpGet("https://noxhub.store/loader"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"trollagem🤣", "trollagem🤣"})


Tab1:AddButton({"music player gui", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/Music%20playey.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"kater hub universal", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/KATERGaming/Roblox/main/KaterHub.Lua"))()
print("Hello World!")
end})

Tab1:AddButton({"FE Trolling GUI", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
print("Hello World!")
end})

Tab1:AddButton({"soluna troll brookhaven", function(Value)
loadstring(game:HttpGet("https://soluna-script.vercel.app/brookhaven.lua",true))()
print("Hello World!")
end})

Tab1:AddButton({"conquista fake doors", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/conquista%20falsa%20doors.lua"))()
print("Hello World!")
end}) 

Tab1:AddButton({"Print", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/controlnpc.lua"))()
print("Hello World!")
end})

local Tab1 = Window:MakeTab({"spawnar mash", "spawnar mash"})

-- Variável de controle
local running = false
local dued -- Vamos criar fora do loop

-- Toggle
local Toggle1 = Tab1:AddToggle({
    Name = "Toggle",
    Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
    Default = false
})

Toggle1:Callback(function(Value)
    running = Value

    -- Cria o part se ainda não existir
    if running and not dued then
        dued = Instance.new("Part", workspace)
        local mesh = Instance.new("SpecialMesh", dued)
        mesh.MeshType = Enum.MeshType.FileMesh
        mesh.MeshId = "rbxassetid://8905201196"
        mesh.TextureId = "rbxassetid://8905201311"

        dued.Size = Vector3.new(1, 1, 1)
        dued.Anchored = false
        dued.Position = Vector3.new(0,5,0) -- posição inicial
    end
end)

-- Loop principal
spawn(function()
    while true do
        if running and dued then
            -- Movimento aleatório
            local dx = math.random(-5,5)/10
            local dy = math.random(1,5)/5
            local dz = math.random(-5,5)/10
            dued.Position = dued.Position + Vector3.new(dx, dy, dz)

            -- Gira o part aleatoriamente
            dued.CFrame = dued.CFrame * CFrame.Angles(
                math.rad(math.random(-90,30)),
                math.rad(math.random(-90,30)),
                math.rad(math.random(-90,30))
            )
        end
        wait(0.1)
    end
end)

