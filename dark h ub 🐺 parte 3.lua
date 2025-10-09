local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redzlib:MakeWindow({
  Title = "DARK HUB🐺: parte 3",
  SubTitle = "by davidgames3d",
  SaveFolder = "testando | redz lib v5.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tab1 = Window:MakeTab({"delta scripts", "main"})

Tab1:AddButton({"infinity yield", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
print("Hello World!")
end})

Tab1:AddButton({"c00lkid Gui v1", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkid-GUI-36102"))()
print("Hello World!")
end})

Tab1:AddButton({"c00lkid Gui v2", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkid-UI-37757"))()
print("Hello World!")
end})

Tab1:AddButton({"FE c00lkid f3x", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126"))()
print("Hello World!")
end}) 

Tab1:AddButton({"m00pgui fe", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-M00PGUI-FE-56044"))()
print("Hello World!")
end})

Tab1:AddButton({"Nightmare script", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Nightmare-script-56265"))()
print("Hello World!")
end})

Tab1:AddButton({"flutuar", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FLOAT-SCRIPT-52755"))()
print("Hello World!")
end})

Tab1:AddButton({"Animations Gui v2", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Animations-Gui-V2-39043"))()
print("Hello World!")
end})