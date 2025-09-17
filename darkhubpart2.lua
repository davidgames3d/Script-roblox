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

local Tab1 = Window:MakeTab({"evade", "evade"})
