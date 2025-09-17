local Tab1 = Window:MakeTab({"forsaken🏚", "forsaken🏚"})

Tab1:AddButton({"forsaken spy", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/rafaijaved/Roblox-Scripts-Keysystems/refs/heads/main/ForsakenESP.lua"))()
print("Hello World!")
end})

Tab1:AddButton({"forsaken script", function(Value)
loadstring(game:HttpGet('https://raw.githubusercontent.com/Ali312809/Scripts/refs/heads/main/forsakenscript.lua'))()
print("Hello World!")
end})

Tab1:AddButton({"Minimalistic Forsaken", function(Value)
local StaminaModule = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)

StaminaModule.StaminaLossDisabled = true
task.spawn(function()
	while true do
		task.wait(0.1)
		StaminaModule.Stamina = StaminaModule.MaxStamina
		StaminaModule.StaminaChanged:Fire()
	end
end)
print("Hello World!")
end})

Tab1:AddButton({"funny hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Forsaken-Funny-Hub-V2-42056"))()
print("Hello World!")
end})

Tab1:AddButton({"rift forsaken", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Slasher-Forsaken-gi-51733"))()
print("Hello World!")
end}) 

Tab1:AddButton({"atherhub forsaken", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Slasher-Forsaken-Atherhub-Forsaken-OVERPOWERED-AUTO-GENERATOR-AND-SPEED-51096"))()
print("Hello World!")
end})
