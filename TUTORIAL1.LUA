-- Coloque este script como LocalScript dentro de StarterPlayerScripts ou StarterGui

-- Criando a ScreenGui
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "CustomMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Botão Toggle (Imagem)
local toggleBtn = Instance.new("ImageButton")
toggleBtn.Name = "ToggleButton"
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0, 10, 0, 10)
toggleBtn.BackgroundTransparency = 1
toggleBtn.Image = "rbxassetid://113123376327046" -- Ícone padrão, pode trocar
toggleBtn.ImageRectOffset = Vector2.new(4, 836)
toggleBtn.ImageRectSize = Vector2.new(48, 48)
toggleBtn.Parent = gui

-- Criando o Frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0, 70, 0, 70)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.Visible = false
mainFrame.Parent = gui

-- Cantos arredondados
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)
corner.Parent = mainFrame

-- Layout dos botões principais
local buttonsFrame = Instance.new("Frame")
buttonsFrame.Size = UDim2.new(1, -60, 1, -20)
buttonsFrame.Position = UDim2.new(0, 60, 0, 10)
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.Parent = mainFrame

local uiList = Instance.new("UIListLayout")
uiList.Padding = UDim.new(0, 5)
uiList.FillDirection = Enum.FillDirection.Vertical
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Parent = buttonsFrame

-- Exemplo de botão de função
local function createFuncButton(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Parent = buttonsFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Private-gui-by-hanif-leak-40943"))()
        -- Aqui você coloca a função do botão
    end)
end

-- Criando alguns botões de exemplo
createFuncButton("script1")
createFuncButton("script2")
createFuncButton("script3")

-- Categorias laterais
local categoryFrame = Instance.new("Frame")
categoryFrame.Size = UDim2.new(0, 50, 1, -20)
categoryFrame.Position = UDim2.new(0, 5, 0, 10)
categoryFrame.BackgroundTransparency = 1
categoryFrame.Parent = mainFrame

local uiList2 = Instance.new("UIListLayout")
uiList2.Padding = UDim.new(0, 5)
uiList2.FillDirection = Enum.FillDirection.Vertical
uiList2.SortOrder = Enum.SortOrder.LayoutOrder
uiList2.Parent = categoryFrame

local function createCategory(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 16
    btn.Parent = categoryFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        print("Categoria "..name.." selecionada!")
        -- Aqui você pode mudar os botões do menu conforme a categoria
    end)
end

-- Criando categorias exemplo
createCategory("Geral")
createCategory("davidgames3d")
createCategory("Outros")

-- Toggle do menu
local aberto = false
toggleBtn.MouseButton1Click:Connect(function()
    aberto = not aberto
    mainFrame.Visible = aberto
end)