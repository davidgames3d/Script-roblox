
local Tab1 = Window:MakeTab({"universal🌏", "universal🌏"})

Tab1:AddButton({"c00lkidd", function(Value)
loadstring(game:HttpGet("https://pastebin.com/raw/MYsVtALF"))()
print("Hello World!")
end})

Tab1:AddButton({"c00lgui v1", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Angelo-Gitland/c00lkidd-Gui-V1-By-Lua-land/refs/heads/main/c00lkidd%20Gui%20V1%20By%20Lua%20Land"))()
print("Hello World!")
end})

Tab1:AddButton({"c00lgui rework", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-C00lgui-Rework-46970"))()
print("Hello World!")
end})

Tab1:AddButton({"fearless gui", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/synkixr/FEARLESS-GUI/refs/heads/main/fearless-gui-by-synkixr"))()
print("Hello World!")
end})

Tab1:AddButton({"raid hub", function(Value)
loadstring(game:HttpGet('https://pastebin.com/raw/TPBeBqmC'))()
print("Hello World!")
end})

Tab1:AddButton({"forsaken/mm2", function(Value) loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
print("Hello World!")
end})

Tab1:AddButton({"invisivel fe", function(Value)
print("Hello World!")
end})
--[[Invisibility Toggle

You can find the orginal concept here: https://v3rmillion.net/showthread.php?tid=544634

This method clones the character locally, teleports the real character to a safe location, then sets the character to the clone.
Basically, your real character is in the sky while you are on the ground.


Because of the way this works, games with a decent anti-cheat will fck this up.
If you turn it off, you have to go to a safe place before going invisible.

Written by: BitingTheDust ; https://v3rmillion.net/member.php?action=profile&uid=1628149
]]
--Settings:
local ScriptStarted = false
local Keybind = "E" --Set to whatever you want, has to be the name of a KeyCode Enum.
local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
local NoClip = false --Will make your fake character no clip.

local Player = game:GetService("Players").LocalPlayer
local RealCharacter = Player.Character or Player.CharacterAdded:Wait()

local IsInvisible = false

RealCharacter.Archivable = true
local FakeCharacter = RealCharacter:Clone()
local Part
Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
Part.CanCollide = true
FakeCharacter.Parent = workspace
FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

for i, v in pairs(RealCharacter:GetChildren()) do
  if v:IsA("LocalScript") then
      local clone = v:Clone()
      clone.Disabled = true
      clone.Parent = FakeCharacter
  end
end
if Transparency then
  for i, v in pairs(FakeCharacter:GetDescendants()) do
      if v:IsA("BasePart") then
          v.Transparency = 0.7
      end
  end
end
local CanInvis = true
function RealCharacterDied()
  CanInvis = false
  RealCharacter:Destroy()
  RealCharacter = Player.Character
  CanInvis = true
  isinvisible = false
  FakeCharacter:Destroy()
  workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid

  RealCharacter.Archivable = true
  FakeCharacter = RealCharacter:Clone()
  Part:Destroy()
  Part = Instance.new("Part", workspace)
  Part.Anchored = true
  Part.Size = Vector3.new(200, 1, 200)
  Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
  Part.CanCollide = true
  FakeCharacter.Parent = workspace
  FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)

  for i, v in pairs(RealCharacter:GetChildren()) do
      if v:IsA("LocalScript") then
          local clone = v:Clone()
          clone.Disabled = true
          clone.Parent = FakeCharacter
      end
  end
  if Transparency then
      for i, v in pairs(FakeCharacter:GetDescendants()) do
          if v:IsA("BasePart") then
              v.Transparency = 0.7
          end
      end
  end
 RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
 Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
end
RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
local PseudoAnchor
game:GetService "RunService".RenderStepped:Connect(
  function()
      if PseudoAnchor ~= nil then
          PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
      end
       if NoClip then
      FakeCharacter.Humanoid:ChangeState(11)
       end
  end
)

PseudoAnchor = FakeCharacter.HumanoidRootPart
local function Invisible()
  if IsInvisible == false then
      local StoredCF = RealCharacter.HumanoidRootPart.CFrame
      RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = StoredCF
      RealCharacter.Humanoid:UnequipTools()
      Player.Character = FakeCharacter
      workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
      PseudoAnchor = RealCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = false
          end
      end

      IsInvisible = true
  else
      local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
     
      RealCharacter.HumanoidRootPart.CFrame = StoredCF
     
      FakeCharacter.Humanoid:UnequipTools()
      Player.Character = RealCharacter
      workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
      PseudoAnchor = FakeCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = true
          end
      end
      IsInvisible = false
  end
end

game:GetService("UserInputService").InputBegan:Connect(
  function(key, gamep)
      if gamep then
          return
      end
      if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
          if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
              Invisible()
          end
      end
  end
)
local Sound = Instance.new("Sound",game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://232127604"
Sound:Play()
game:GetService("StarterGui"):SetCore("SendNotification",{["Title"] = "Invisible Toggle Loaded",["Text"] = "Press "..Keybind.." to become change visibility.",["Duration"] = 20,["Button1"] = "Okay."})
Tab1:AddButton({"aim bot universal", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Volcano-universal-aimbot-36995"))()
print("Hello World!")
end})

Tab1:AddButton({"player emote", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Emotes-Player-and-Catalog-Searcher-52056"))()
print("Hello World!")
end})

Tab1:AddButton({"painel HD admin", function(Value)
 loadstring(game:HttpGet("https://pastebin.com/raw/KMp8Jvsa",true))() ----------- Intro GUI

local Player = game.Players.LocalPlayer ------------- START OF SCRIPT

Player.Chatted:connect(function(cht)         ----------- CMD SMART
	if cht:match(":cmd") then 
		loadstring(game:HttpGet("https://pastebin.com/raw/M3tZZAqa",true))()
	elseif cht:match(":toolgui") then                                -------------------- TOOL GUI PART / END OF CMD
		
	loadstring(game:HttpGet("https://pastebin.com/raw/txadLpTy",true))()
	
	elseif cht:match(":savetool") then
			for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer
end
			end
	elseif cht:match(":loadtool") then
		for _,v in pairs(game.Players.LocalPlayer:GetChildren()) do
if (v:IsA("Tool")) then
v.Parent = game.Players.LocalPlayer.Backpack
end
		end
	elseif cht:match(":antiafk") then  --------------------------------- END OF TOOL GUI PART
		local VirtualUser=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)
		
					        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Loaded";
            Text = "Anti AFK Script";
			        })
		
	elseif cht:match(":blockhead") then
		game.Players.LocalPlayer.Character.Head.Mesh:destroy()
	elseif cht:match(":creeper6") then
		game.Players.LocalPlayer.Character.Head.Mesh:destroy()
function doo(limb, pos)
limb:BreakJoints()
local velocity = Instance.new("RocketPropulsion", limb)
velocity.CartoonFactor = 0
velocity.MaxSpeed = 30
velocity.MaxThrust = 9999
velocity.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
velocity.Target = game.Players.LocalPlayer.Character.Torso
velocity.TargetOffset = pos
velocity:fire()
local b = Instance.new("BodyGyro", limb)
end
while wait() do
doo(game.Players.LocalPlayer.Character["Left Arm"], Vector3.new(-0.5,-2,-1))
doo(game.Players.LocalPlayer.Character["Right Arm"], Vector3.new(0.5,-2,-1))
doo(game.Players.LocalPlayer.Character["Left Leg"], Vector3.new(-0.5,-2,1))
doo(game.Players.LocalPlayer.Character["Right Leg"], Vector3.new(0.5,-2,1))
end
	elseif cht:match(":creeper15") then
		game.Players.LocalPlayer.Character.Head.Mesh:destroy()
function doo(limb, pos)
limb:BreakJoints()
local velocity = Instance.new("RocketPropulsion", limb)
velocity.CartoonFactor = 0
velocity.MaxSpeed = 30
velocity.MaxThrust = 9999
velocity.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
velocity.Target = game.Players.LocalPlayer.Character.UpperTorso
velocity.TargetOffset = pos
velocity:fire()
local b = Instance.new("BodyGyro", limb)
end
while wait() do
doo(game.Players.LocalPlayer.Character["LeftUpperArm"], Vector3.new(-0.5,-2,-1))
doo(game.Players.LocalPlayer.Character["RightUpperArm"], Vector3.new(0.5,-2,-1))
doo(game.Players.LocalPlayer.Character["LeftUpperLeg"], Vector3.new(-0.5,-2,1))
doo(game.Players.LocalPlayer.Character["RightUpperLeg"], Vector3.new(0.5,-2,1))
end
	elseif cht:match(":shattervest") then
		loadstring(game:HttpGet("https://pastebin.com/raw/CKbPg9NC", true))()
	elseif cht:match(":animationgui") then
		loadstring(game:HttpGet("https://pastebin.com/raw/uUR6pFVv", true))()
	elseif cht:match(":gabx") then
		loadstring(game:HttpGet("https://pastebin.com/raw/EntUzD5J", true))();
	elseif cht:match(":clickdel") then
		local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Mouse.Target:Destroy()
end)
		
	elseif cht:match(":trollinggui") then
		loadstring(game:HttpGet("https://pastebin.com/raw/RNWgaqCE", true))()
	elseif cht:match(":infinitejump") then
		local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
	elseif cht:match(":opfianlity") then
		loadstring(game:HttpGet("https://pastebin.com/raw/w8HNfSWA", true))();
	elseif cht:match(":aimbot1") then
		loadstring(game:HttpGet("https://pastebin.com/raw/2kbyfrn5", true))()
	elseif cht:match("aimbot2") then
		loadstring(game:HttpGet("https://pastebin.com/raw/xB92ES44", true))()
	elseif cht:match("aimbotgui") then
		loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY", true))()
		
	elseif cht:match(":openui") then  -- secret script if you open the pastebin :))
		loadstring(game:HttpGet("https://pastebin.com/raw/F9USVzSK",true))()
	end
end)

------------------------------------------------------------------------------- END OF SCRIPT ------------------------------------------------------------------


loadstring(game:HttpGet("https://pastebin.com/raw/F9USVzSK",true))()

			        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Loaded";
            Text = "Ultimate Admin Script";
			        })
			
			print("Working Admin Script")
print("Hello World!")
end})

Tab1:AddButton({"admin require", function(Value)
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
require(7192763922).load("playername")
print("Hello World!")
end})

Tab1:AddButton({"C00LGUI", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/apanel", true))()
print("Hello World!")
end})

Tab1:AddButton({"F3X", function(Value)
loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
print("Hello World!")
end})

Tab1:AddButton({"BTools", function(Value)
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
print("Hello World!")
end})

Tab1:AddButton({"Noclip", function(Value)
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Plr = Players.LocalPlayer
local Clipon = false

Noclip.Name = "Noclip"
Noclip.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "Noclip"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left


Toggle.MouseButton1Click:connect(function()
	if Status.Text == "off" then
		Clipon = true
		Status.Text = "on"
		Status.TextColor3 = Color3.new(0,185,0)
		Stepped = game:GetService("RunService").Stepped:Connect(function()
			if not Clipon == false then
				for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
			else
				Stepped:Disconnect()
			end
		end)
	elseif Status.Text == "on" then
		Clipon = false
		Status.Text = "off"
		Status.TextColor3 = Color3.new(170,0,0)
	end
end)
print("Hello World!")
end})

Tab1:AddButton({"FLY GUI V3", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
print("Hello World!")
end})

Tab1:AddButton({"hoho hub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-HoHo-Hub-29869"))()
print("Hello World!")
end})

Tab1:AddButton({"remainshub", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-RemainsHub-V3-51691"))()
print("Hello World!")
end})

Tab1:AddButton({"admin panel", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Admin-Panel-53076"))()
print("Hello World!")
end})

Tab1:AddButton({"infinite Yield", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()
print("Hello World!")
end})

Tab1:AddButton({"ghost hub", function(Value)
loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
print("ghost Hub")
end})

Tab1:AddButton({"david gui", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DAVIDGUI.lua"))()
print("david gui")
end})

Tab1:AddButton({"david hub v8", function(Value)
loadstring(game:HttpGet("https://github.com/davidgames3d/Script-roblox/blob/main/David_hub_v8.lua",true))()
print("david hub")
end})

Tab1:AddButton({"r15 para r6", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-to-r6-script-working-all-game-26416"))()
print("r15 to r6")
end})

Tab1:AddButton({"c00lkiddgui", function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/c00lkiddHUB.lua"))()
print("c00lkidd")
end})

Tab1:AddButton({"admin troll", function(Value) loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Private-gui-by-hanif-leak-40943"))()
print("gui admin")
end})

Tab1:AddButton({"tiger hub x v4", function(Value) 
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v4-42180"))()
print("tiger hub")
end})   

Tab1:AddButton({"afem Animation pack", function(Value)
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AFEM-14048"))()
print("Hello World!")
end})
