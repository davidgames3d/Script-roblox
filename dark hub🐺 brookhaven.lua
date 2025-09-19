local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
  Title = "dark hub🐺 : brookhaven RP🏡",
  SubTitle = "by davidgames3d",
  SaveFolder = "testando | redz lib v5.lua"
})
local Tab1 = Window:MakeTab({"main🏡", "house"})

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

local Tab1 = Window:MakeTab({"scripts", "scripts"})

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