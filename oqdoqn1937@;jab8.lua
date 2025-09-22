-- Lista de keys válidas
local validKeys = {
    "aofn19kh", 
    "apxnqodnw", 
    "10372947", 
    "qojfeonfie"
}

-- Função pra checar se a key é válida
local function checkKey(userKey)
    for _, key in pairs(validKeys) do
        if key == userKey then
            return true
        end
    end
    return false
end

-- Criando a GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeyGui"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = screenGui

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 40)
textBox.Position = UDim2.new(0.5, -100, 0.3, 0)
textBox.PlaceholderText = "Digite sua key"
textBox.Text = ""
textBox.ClearTextOnFocus = true
textBox.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 40)
button.Position = UDim2.new(0.5, -100, 0.65, 0)
button.Text = "Validar Key"
button.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

-- Função do botão
button.MouseButton1Click:Connect(function()
    local inputKey = textBox.Text
    if checkKey(inputKey) then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DARK%20HUB%20VIP%E2%AD%90%20version.lua"))()
        print("Key aceita! Rodando Dark HUB VIP⭐")
        screenGui:Destroy() -- Fecha a GUI depois de aceitar
    else
        warn("Key inválida! Você não tem acesso à versão VIP.")
        textBox.Text = "" -- Limpa o TextBox
    end
end)