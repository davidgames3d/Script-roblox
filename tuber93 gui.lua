--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--[INSTANCES]


local main = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local titler = Instance.new("TextLabel")
local button = Instance.new("TextButton")
local button2 = Instance.new("TextButton")
local button3 = Instance.new("TextButton")
local button4 = Instance.new("TextButton")
local button5 = Instance.new("TextButton")
local button6 = Instance.new("TextButton")
local button7 = Instance.new("TextButton")


local close = Instance.new("TextButton")
--[UI]

main.Name = "main"
main.Parent = game.CoreGui

frame.Name = "frame"
frame.Parent = main
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 3
frame.Position = UDim2.new(0,3,0.3,0)
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Active = true
frame.Draggable = true

titler.Name = "titler"
titler.Parent = frame
titler.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titler.BorderColor3 = Color3.fromRGB(255, 0, 0)
titler.BorderSizePixel = 3
titler.Size = UDim2.new(0, 300, 0, 40)
titler.Font = Enum.Font.SourceSans
titler.Text = "tubers93's GUI v1.1"
titler.TextColor3 = Color3.fromRGB(255, 255, 255)
titler.TextSize = 24.000

button.Name = "button"
button.Parent = frame
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button.BorderColor3 = Color3.fromRGB(255, 0, 0)
button.BorderSizePixel = 3
button.Position = UDim2.new(0, 0, 0.100000001, 0)
button.Size = UDim2.new(0, 75, 0, 30)
button.Font = Enum.Font.SourceSans
button.Text = "Floating Pad"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.TextSize = 14.000
button.TextWrapped = true
button.MouseButton1Down:connect(function()
        local name = game.Players.LocalPlayer.Name

        local p = Instance.new("Part")
        p.Parent = workspace
        p.Locked = true
        p.BrickColor = BrickColor.new("White")
        p.BrickColor = BrickColor.new(104)
        p.Size = Vector3.new(8, 1.2, 8)
        p.Anchored = true
        local m = Instance.new("CylinderMesh")
        m.Scale = Vector3.new(1, 0.5, 1)
        m.Parent = p
        while true do
            p.CFrame = CFrame.new(game.Players:findFirstChild(name).Character.Torso.CFrame.x,
game.Players:findFirstChild(name).Character.Torso.CFrame.y - 4, game.Players:findFirstChild(name).Character.Torso.CFrame.z)
            wait()
        end
end)

button2.Name = "button2"
button2.Parent = frame
button2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button2.BorderColor3 = Color3.fromRGB(255, 0, 0)
button2.BorderSizePixel = 3
button2.Position = UDim2.new(0.25, 0, 0.100000001, 0)
button2.Size = UDim2.new(0, 75, 0, 30)
button2.Font = Enum.Font.SourceSans
button2.Text = "Tiger Admin"
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.TextSize = 14.000
button2.TextWrapped = true
button2.MouseButton1Down:connect(function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Prison-Life-TIGER-ADMIN-REVAMPED-7593"))()
end)

button3.Name = "button3"
button3.Parent = frame
button3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button3.BorderColor3 = Color3.fromRGB(255, 0, 0)
button3.BorderSizePixel = 3
button3.Position = UDim2.new(0.5, 0, 0.100000001, 0)
button3.Size = UDim2.new(0, 75, 0, 30)
button3.Font = Enum.Font.SourceSans
button3.Text = "c00lgui revival v2.2"
button3.TextColor3 = Color3.fromRGB(255, 255, 255)
button3.TextSize = 14.000
button3.TextWrapped = true
button3.MouseButton1Down:connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/theawesomari0/c00lgui/66033e8ff67eccc421fb04b3924e42d4adf3d7a2/c00lgui%20v2.2?subid1=20230826-2047-4399-8bd3-612370889e32",true))()
end)

button4.Name = "button4"
button4.Parent = frame
button4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button4.BorderColor3 = Color3.fromRGB(255, 0, 0)
button4.BorderSizePixel = 3
button4.Position = UDim2.new(0.5, 0, 0.847500026, 0)
button4.Size = UDim2.new(0, 75, 0, 30)
button4.Font = Enum.Font.SourceSans
button4.Text = "Fedora Admin"
button4.TextColor3 = Color3.fromRGB(255, 255, 255)
button4.TextSize = 14.000
button4.TextWrapped = true
button4.MouseButton1Down:connect(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/alexx1212/fedoratoomutch/main/toomucth'))()
end)

button5.Name = "button5"
button5.Parent = frame
button5.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button5.BorderColor3 = Color3.fromRGB(255, 0, 0)
button5.BorderSizePixel = 3
button5.Position = UDim2.new(0.25, 0, 0.324999988, 0)
button5.Size = UDim2.new(0, 75, 0, 30)
button5.Font = Enum.Font.SourceSans
button5.Text = "Fly GUI"
button5.TextColor3 = Color3.fromRGB(255, 255, 255)
button5.TextSize = 14.000
button5.TextWrapped = true
button5.MouseButton1Down:connect(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/y7GnniTi",true))()
end)

button6.Name = "button6"
button6.Parent = frame
button6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button6.BorderColor3 = Color3.fromRGB(255, 0, 0)
button6.BorderSizePixel = 3
button6.Position = UDim2.new(0.75, 0, 0.100000001, 0)
button6.Size = UDim2.new(0, 75, 0, 30)
button6.Font = Enum.Font.SourceSans
button6.Text = "DTexe"
button6.TextColor3 = Color3.fromRGB(255, 255, 255)
button6.TextSize = 14.000
button6.TextWrapped = true
button6.MouseButton1Down:connect(function()
        print '--[THIS EXECUTOR IS MADE BY the0man0of0man or the0man0of0_alt]'
print '--[DIGITAL TACTICAL MEMBER AND RANK : '
print '1. the0man0of0man or the0man0of0_alt : Owner/Boss'
print '2. the_ad3min666 : Co-Founder'
print '3. Alt_ThenoobPlayer : Admin/Moderator'
print '4. blueyheerle : high-rank member]--'

--[Instances]
local main = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local tilter = Instance.new("TextLabel")
local script = Instance.new("TextBox")
local execute = Instance.new("TextButton")
local clear = Instance.new("TextButton")

--[UI]

main.Name = "main"
main.Parent = game.CoreGui

frame.Name = "frame"
frame.Parent = main
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
frame.BorderSizePixel = 3
frame.Position = UDim2.new(-0.00133678317, 0, -0.00348037481, 0)
frame.Size = UDim2.new(0, 438, 0, 238)
frame.Active = true
frame.Draggable = true

tilter.Name = "tilter"
tilter.Parent = frame
tilter.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
tilter.BorderColor3 = Color3.fromRGB(255, 0, 0)
tilter.BorderSizePixel = 3
tilter.Position = UDim2.new(0.997245014, 0, 0, 0)
tilter.Size = UDim2.new(0, 397, 0, 30)
tilter.Font = Enum.Font.GothamSemibold
tilter.Text = "DTexe"
tilter.TextColor3 = Color3.fromRGB(255, 255, 255)
tilter.TextScaled = true
tilter.TextSize = 12.000
tilter.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
tilter.TextWrapped = true

script.Name = "script"
script.Parent = frame
script.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
script.Position = UDim2.new(0.531963468, 0, 0.466386557, 0)
script.Size = UDim2.new(0, 199, 0, 50)
script.ZIndex = 999999
script.ClearTextOnFocus = false
script.Font = Enum.Font.GothamSemibold
script.Text = "--Paste here"
script.TextColor3 = Color3.fromRGB(255, 255, 255)
script.TextSize = 14.000
script.TextWrapped = true

execute.Name = "execute"
execute.Parent = frame
execute.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
execute.BorderSizePixel = 3
execute.Position = UDim2.new(0.0159817357, 0, 0.142857149, 0)
execute.Size = UDim2.new(0, 209, 0, 33)
execute.Font = Enum.Font.SourceSans
execute.Text = "Execute"
execute.TextColor3 = Color3.fromRGB(0, 0, 0)
execute.TextSize = 30.000
execute.TextWrapped = true
execute.MouseButton1Down:connect(function()
        loadstring(script.Text)() -- loadstring is broken in studio dont worry
        print 'your script has been executed'
end)
      
clear.Name = "clear"
clear.Parent = frame
clear.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
clear.BorderSizePixel = 3
clear.Position = UDim2.new(0.509132445, 0, 0.142857149, 0)
clear.Size = UDim2.new(0, 209, 0, 33)
clear.Font = Enum.Font.SourceSans
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(0, 0, 0)
clear.TextSize = 30.000
clear.TextWrapped = true
clear.MouseButton1Down:connect(function()
        script.Text = ""
        print 'your textbox has been clear'
end)

end)

button7.Name = "button7"
button7.Parent = frame
button7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button7.BorderColor3 = Color3.fromRGB(255, 0, 0)
button7.BorderSizePixel = 3
button7.Position = UDim2.new(-0.00333331339, 0, 0.175000012, 0)
button7.Size = UDim2.new(0, 75, 0, 30)
button7.Font = Enum.Font.SourceSans
button7.Text = "[FE] Energize GUI"
button7.TextColor3 = Color3.fromRGB(255, 255, 255)
button7.TextSize = 14.000
button7.TextWrapped = true
button7.MouseButton1Down:connect(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/vrDfzbiA",true))()        
end)

        
        







close.Name = "close"
close.Name = main
close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
close.BorderColor3 = Color3.fromRGB(255, 0, 0)
close.BorderSizePixel = 3
close.Position = UDim2.new(0,3,0.3,380)
close.Size = UDim2.new(0, 300, 0, 20)
close.Font = Enum.Font.SourceSans
close.Text = "Close"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextSize = 18.000
close.MouseButton1Down:connect(function()
        if close.Text == "Close" then
            frame.Visible = false
            close.Text = "Open" else
            frame.Visible = true
            close.Text = "Close"
        end
end)
            
            