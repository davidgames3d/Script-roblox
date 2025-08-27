-- // GUI TOGGLE SCRIPT PARA DELTA EXECUTOR \\ --
-- Autor: Davidgames3d V 

-- Verifica se já existe a GUI para evitar duplicação
if game.CoreGui:FindFirstChild("c00lkidGui") then
    game.CoreGui.c00lkidGui:Destroy()
end

-- Criar ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "c00lkidGui"
gui.Parent = game.CoreGui

-- Criar botão flutuante (toggle)
local toggle = Instance.new("ImageButton")
toggle.Name = "ToggleButton"
toggle.Parent = gui
toggle.Size = UDim2.new(0, 50, 0, 50)
toggle.Position = UDim2.new(0.05, 0, 0.2, 0) -- posição na tela
toggle.BackgroundTransparency = 1
toggle.Image = "rbxassetid://12869420933" -- ícone (muda se quiser)
toggle.Active = true
toggle.Draggable = true -- pode arrastar na tela do celular

-- Criar mini janela (quadrado vermelho transparente)
local frame = Instance.new("Frame")
frame.Name = "MiniJanela"
frame.Parent = gui
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.2, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
frame.BackgroundTransparency = 0.3
frame.Visible = false -- começa fechada

-- Texto "c00lkid"
local label = Instance.new("TextLabel")
label.Parent = frame
label.Size = UDim2.new(1, 0, 0.3, 0)
label.Position = UDim2.new(0, 0, 0, 0)
label.BackgroundTransparency = 1
label.Text = "c00lkid"
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextScaled = true
label.Font = Enum.Font.SourceSansBold

-- Botão interno
local innerButton = Instance.new("TextButton")
innerButton.Parent = frame
innerButton.Size = UDim2.new(0.3, 0, 0.1, 0)
innerButton.Position = UDim2.new(0.0, 0, 0.3, 0)
innerButton.Text = "C00lgui v1 reborn"
innerButton.TextScaled = true
innerButton.Font = Enum.Font.SourceSans
innerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- Função de toggle (abrir/fechar a janela)
local aberto = false
toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Exemplo de ação quando clicar no botão da janela
innerButton.MouseButton1Click:Connect(function()
    print("Botão interno clicado! Executando ação...")
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-Reborn-Rc7-by-v3rx-48261"))()
end)

-- Botão interno
local innerButton = Instance.new("TextButton")
innerButton.Parent = frame
innerButton.Size = UDim2.new(0.3, 0, 0.1, 0)
innerButton.Position = UDim2.new(0.0, 0, 0.5, 0)
innerButton.Text = "C00lgui deluxe"
innerButton.TextScaled = true
innerButton.Font = Enum.Font.SourceSans
innerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- Função de toggle (abrir/fechar a janela)
local aberto = false
toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Exemplo de ação quando clicar no botão da janela
innerButton.MouseButton1Click:Connect(function()
    print("Botão interno clicado! Executando ação...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126"))()
end)

-- Botão interno
local innerButton = Instance.new("TextButton")
innerButton.Parent = frame
innerButton.Size = UDim2.new(0.3, 0, 0.1,0)
innerButton.Position = UDim2.new(0.0, 0, 0.8, 0)
innerButton.Text = "C00lkid gui"
innerButton.TextScaled = true
innerButton.Font = Enum.Font.SourceSans
innerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- Função de toggle (abrir/fechar a janela)
local aberto = false
toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Exemplo de ação quando clicar no botão da janela
innerButton.MouseButton1Click:Connect(function()
    print("Botão interno clicado! Executando ação...")
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkid-GUI-36102"))()
end)

-- Botão interno
local innerButton = Instance.new("TextButton")
innerButton.Parent = frame
innerButton.Size = UDim2.new(0.3, 0, 0.1, 0)
innerButton.Position = UDim2.new(0.6, 0, 0.5, 0)
innerButton.Text = "tiger x hub"
innerButton.TextScaled = true
innerButton.Font = Enum.Font.SourceSans
innerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- Função de toggle (abrir/fechar a janela)
local aberto = false
toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Exemplo de ação quando clicar no botão da janela
innerButton.MouseButton1Click:Connect(function()
    print("Botão interno clicado! Executando ação...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tiger-hub-x-v35-17788"))()
end)

-- Botão interno
local innerButton = Instance.new("TextButton")
innerButton.Parent = frame
innerButton.Size = UDim2.new(0.3, 0, 0.1, 0)
innerButton.Position = UDim2.new(0.29, 0, 0.5, 0)
innerButton.Text = "sans hub"
innerButton.TextScaled = true
innerButton.Font = Enum.Font.SourceSans
innerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- Função de toggle (abrir/fechar a janela)
local aberto = false
toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Exemplo de ação quando clicar no botão da janela
innerButton.MouseButton1Click:Connect(function()
    print("Botão interno clicado! Executando ação...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-SANS-HUB-16674"))()
end)

-- Botão interno
local innerButton = Instance.new("TextButton")
innerButton.Parent = frame
innerButton.Size = UDim2.new(0.3, 0, 0.1, 0)
innerButton.Position = UDim2.new(0.29, 0, 0.9, 0)
innerButton.Text = "r6 c00lkid"
innerButton.TextScaled = true
innerButton.Font = Enum.Font.SourceSans
innerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- Função de toggle (abrir/fechar a janela)
local aberto = false
toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Exemplo de ação quando clicar no botão da janela
innerButton.MouseButton1Click:Connect(function()
    print("Botão interno clicado! Executando ação...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-C00lKidd-Forsaken-UNIVERSAL-FOR-R6-44107"))()
end)

-- Botão interno
local innerButton = Instance.new("TextButton")
innerButton.Parent = frame
innerButton.Size = UDim2.new(0.3, 0, 0.1, 0)
innerButton.Position = UDim2.new(0.29, 0, 0.7, 0)
innerButton.Text = "c00lman"
innerButton.TextScaled = true
innerButton.Font = Enum.Font.SourceSans
innerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- Função de toggle (abrir/fechar a janela)
local aberto = false
toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Exemplo de ação quando clicar no botão da janela
innerButton.MouseButton1Click:Connect(function()
    print("Botão interno clicado! Executando ação...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-C00LKID-F3X-SCRIPT-40126"))()
end)

-- Botão interno
local innerButton = Instance.new("TextButton")
innerButton.Parent = frame
innerButton.Size = UDim2.new(0.3, 0, 0.1, 0)
innerButton.Position = UDim2.new(0.29, 0, 0.8, 0)
innerButton.Text = "brookhaven"
innerButton.TextScaled = true
innerButton.Font = Enum.Font.SourceSans
innerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)

-- Função de toggle (abrir/fechar a janela)
local aberto = false
toggle.MouseButton1Click:Connect(function()
    aberto = not aberto
    frame.Visible = aberto
end)

-- Exemplo de ação quando clicar no botão da janela
innerButton.MouseButton1Click:Connect(function()
    print("Botão interno clicado! Executando ação...")
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Script-Brookhaven-RP-New-50301"))()
end)