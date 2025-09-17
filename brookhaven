local Tab1 = Window:MakeTab({"brookhaven🏡", "brookhaven🏡"})

Tab1:AddButton({"sander xy", function(Value) 
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Sander-XY-35845"))()
print("Hello World!")
end})

Tab1:AddButton({"cartola hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Davi999z/Cartola-Hub/refs/heads/main/Brookhaven",true))()
print("cartola hub")
end}) 

Tab1:AddButton({"antares hub original", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/BorisLua/AntaresHubSuaMaeNaMinhaCama/refs/heads/main/AntaresHubWorking.lua"))()
print("2024 voltemo")
end})

Tab1:AddButton({"zynora hub", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/PwyJLxeJ"))()
print("Hello World!")
end})

Tab1:AddButton({"bring all", function(Value)
-- Simple Bring All GUI with Enable/Disable Toggle
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local bringEnabled = false
local bringLoop

-- GUI Setup
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.Name = "BringAllGUI"

local enableButton = Instance.new("TextButton", screenGui)
enableButton.Size = UDim2.new(0, 200, 0, 50)
enableButton.Position = UDim2.new(0.5, -100, 0.4, 0)
enableButton.Text = "Enable Bring All"
enableButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local disableButton = Instance.new("TextButton", screenGui)
disableButton.Size = UDim2.new(0, 200, 0, 50)
disableButton.Position = UDim2.new(0.5, -100, 0.5, 0)
disableButton.Text = "Disable Bring All"
disableButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- Bring function
local function bringPlayers()
    bringLoop = task.spawn(function()
        while bringEnabled do
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if root then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local theirRoot = player.Character.HumanoidRootPart
                        theirRoot.CFrame = root.CFrame + Vector3.new(math.random(-5, 5), 1, math.random(-5, 5))
                    end
                end
            end
            task.wait(0.5)
        end
    end)
end

-- Button callbacks
enableButton.MouseButton1Click:Connect(function()
    if not bringEnabled then
        bringEnabled = true
        bringPlayers()
    end
end)

disableButton.MouseButton1Click:Connect(function()
    bringEnabled = false
    if bringLoop then
        task.cancel(bringLoop)
    end
end)
print("Hello World!")
end})

Tab1:AddButton({"soluna hub", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua",true))()
print("Hello World!")
end})
