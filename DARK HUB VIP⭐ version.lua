local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
  Title = "DARK HUB⭐vip universal",
  SubTitle = "by davidgames3d",
  SaveFolder = "testando | redz lib v5.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://99784233691859", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})Tab1:AddDiscordInvite({
    Name = "DARK HUB SERVER",
    Description = "Join server",
    Logo = "rbxassetid://7096480483",
    Invite = "https://discord.gg/qXkvYQYKZG",
})

local Tab1 = Window:MakeTab({"main", "main"})

Tab1:AddButton({"versão original", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DARKHUB🐺.lua"))()
print("Hello World!")
end})
