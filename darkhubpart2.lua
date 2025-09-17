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

Tab1:AddButton({"c00lkidd fe", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/qwertys/refs/heads/main/qwerty2.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"noli fe", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/qwertys/refs/heads/main/qwerty0.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"fe fake vr", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"FE HUB", function(Value)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fe classic stuff hub ",
    SubTitle = "listed by greyssman",
    TabWidth = 160,
    Size = UDim2.fromOffset(460, 250),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl 
})

local Tabs = {
    Main = Window:AddTab({ Title = "fe script", Icon = "contact" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Loaded",
        Content = "old script revive loaded",
        SubContent = "archived by greyssman",
        Duration = 5
    })



    Tabs.Main:AddParagraph({
        Title = "reset when swiching to others script (dont spam it)",
        Content = ""
    })



    Tabs.Main:AddButton({
        Title = "Fe Ravager",
        Description = "Fe Ravager convert from Im_patrick, date : Jun 18, 2022",
        Callback = function()
             loadstring(game:HttpGet('https://pastebin.com/raw/nVHcJ1df'))()
        end
    })
    
    
    Tabs.Main:AddButton({
        Title = "fe among us v2",
        Description = "amongus v2 created by myworld, date : May 2, 2022",
        Callback = function()
          loadstring(game:HttpGet('https://rawscripts.net/raw/Nothing-Fe-Among-Us-V2-(R6)-3224'))()
        end
    })
    
    Tabs.Main:AddButton({
        Title = "fe nameless animation v4",
        Description = "nameless animation created by myworld, date : Jun 28, 2022",
        Callback = function()
                      loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-FE-Nameless-Animations-V4-4249'))()
        end
    })

	Tabs.Main:AddButton({
        Title = "fe cop v2",
        Description = "fe cop , date : Jun 1st, 2022",
        Callback = function()
                      loadstring(game:HttpGet('https://pastebin.com/raw/vfdDh1eN'))()
        end
    })

    Tabs.Main:AddButton({
        Title = "fe grandmaster",
        Description = "date : Nov 18, 2022",
        Callback = function()
         loadstring(game:HttpGet('https://pastebin.com/raw/jnfLkZVR'))()
        end
    })
if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then return game:GetService("TeleportService"):Teleport(17574618959, game:GetService("Players").LocalPlayer) end
Tabs.Main:AddButton({
        Title = "fe chill",
        Description = "make ur character floating with a chill style",
        Callback = function()
                            loadstring(game:HttpGet('https://rawscripts.net/raw/Just-a-baseplate.-Fe-Chill-14103'))()
        end
    })
    Tabs.Main:AddButton({
        Title = "fe sonic",
        Description = "make ur body animating as sonic",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/RZrtcvh4'))()
        end
    })

Tabs.Main:AddButton({
        Title = "fe pandora",
        Description = "convert from Im_patrick , date : Jun 1, 2022",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/xLNc0bhU'))()
        end
    })

Tabs.Main:AddButton({
        Title = "fe elio blasio",
        Description = "date : Oct 14, 2020",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/W5iuLxJC'))()
        endg
    })

	Tabs.Main:AddButton({
        Title = "fe maxilito slasher",
        Description = "slasher script converted by maxilito, date : Mar 3rd, 2023",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/kP0uNBek'))()
        end
    })
    
    Tabs.Main:AddButton({
        Title = "fe clovr",
        Description = "turn ur body into vr can be without vr",
        Callback = function()
                            loadstring(game:HttpGet('https://rawscripts.net/raw/Just-a-baseplate.-Fe-Clovr-14102'))()
        end
    })
    

end
    
Window:SelectTab(1)
   
print("Hello World!")
end})

