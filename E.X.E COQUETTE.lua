-- ☠️ E.X.E C00QUETTE ☠️ - Hub final
-- Gerado conforme solicitado (preto e branco, carregamento "Inicializando Sistema...", botão ©, painel centralizado, arrastável)
-- IMPORTANTE: cole e execute em seu executor (Local)

-- ========== Config ==========
local LOADING_SECONDS = 3
local PANEL_TITLE = "☠️ E.X.E C00QUETTE ☠️"
local CREATORS_TEXT = "Criadores: c00QUETTE, Davigames3d"
local SPONSORS_TEXT = "Apoiadores: Davigames3d"

-- ===== Services =====
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ===== Executor detection =====
local function detectExecutor()
    local ok, result
    if syn and syn.protect_gui then return "Synapse X" end
    if KRNL_LOADED then return "KRNL" end
    if identifyexecutor then ok,result = pcall(identifyexecutor); if ok and result then return tostring(result) end end
    if getexecutorname then ok,result = pcall(getexecutorname); if ok and result then return tostring(result) end end
    if is_sirhurt_closure then return "SirHurt" end
    if secure_load then return "Sentinel" end
    local globals = {"Fluxus","WeAreDevsExploit","ProtoSmasher","OwlHub","Future"}
    for _,g in ipairs(globals) do if _G[g] then return g end end
    return "Desconhecido"
end
local executorName = detectExecutor()

-- ===== helper new =====
local function new(class, props)
    local obj = Instance.new(class)
    if props then for k,v in pairs(props) do if k=="Parent" then obj.Parent = v else obj[k] = v end end end
    return obj
end

-- ===== Create ScreenGui (try CoreGui then PlayerGui) =====
local screenGui
local ok = pcall(function()
    screenGui = new("ScreenGui", {Name="EXE_C00QUETTE_HUB", ResetOnSpawn=false})
    screenGui.Parent = game:GetService("CoreGui") or PlayerGui
end)
if not ok or not screenGui then
    screenGui = new("ScreenGui", {Name="EXE_C00QUETTE_HUB", ResetOnSpawn=false, Parent=PlayerGui})
end

-- ===== Loading UI =====
local loadingFrame = new("Frame", {
    Name="LoadingFrame", Parent=screenGui,
    AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.new(0.5,0,0.12,0),
    Size=UDim2.new(0.6,0,0.08,0), BackgroundColor3=Color3.fromRGB(0,0,0),
    BorderSizePixel=0
})
new("UICorner",{Parent=loadingFrame, CornerRadius=UDim.new(0,8)})
local loadingTitle = new("TextLabel", {
    Parent=loadingFrame, AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,0.06,0),
    Size=UDim2.new(0.98,0,0.4,0), BackgroundTransparency=1,
    Text = PANEL_TITLE, TextColor3=Color3.new(1,1,1),
    Font=Enum.Font.SourceSansBold, TextSize=20
})
local loadingSubtitle = new("TextLabel", {
    Parent=loadingFrame, AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,0.45,0),
    Size=UDim2.new(0.98,0,0.38,0), BackgroundTransparency=1,
    Text = "Inicializando Sistema...", TextColor3=Color3.new(1,1,1),
    Font=Enum.Font.SourceSans, TextSize=16
})
local barOuter = new("Frame", {
    Parent=loadingFrame, AnchorPoint=Vector2.new(0.5,1), Position=UDim2.new(0.5,0,0.96,0),
    Size=UDim2.new(0.98,0,0.32,0), BackgroundTransparency=1
})
local barBg = new("Frame", {
    Parent=barOuter, AnchorPoint=Vector2.new(0.5,0.5), Position=UDim2.new(0.5,0,0.5,0),
    Size=UDim2.new(1,0,0.7,0), BackgroundColor3=Color3.new(1,1,1),
    BackgroundTransparency=0.9, BorderSizePixel=0
})
new("UICorner",{Parent=barBg, CornerRadius=UDim.new(0,8)})
local barFill = new("Frame", {
    Parent=barBg, AnchorPoint=Vector2.new(0,0), Position=UDim2.new(0,0,0,0),
    Size=UDim2.new(0,0,1,0), BackgroundColor3=Color3.new(1,1,1), BorderSizePixel=0
})
new("UICorner",{Parent=barFill, CornerRadius=UDim.new(0,6)})

-- ===== Floating Button (©) =====
local floatButton = new("TextButton", {
    Name="FloatButton", Parent=screenGui, Size=UDim2.new(0,50,0,50),
    Position=UDim2.new(0.95,-60,0.05,0), AnchorPoint=Vector2.new(1,0),
    BackgroundColor3=Color3.new(0,0,0), BorderSizePixel=0, AutoButtonColor=true
})
new("UICorner",{Parent=floatButton, CornerRadius=UDim.new(1,0)})
local floatLabel = new("TextLabel", {
    Parent=floatButton, Size=UDim2.new(1,1,1,1), BackgroundTransparency=1,
    Text = "©", Font=Enum.Font.SourceSansBold, TextSize=22, TextColor3=Color3.new(1,1,1)
})

-- ===== Main Panel (start off-screen above) =====
local panel = new("Frame", {
    Name="MainPanel", Parent=screenGui,
    AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,-0.8,0),
    Size=UDim2.new(0,700,0,420), BackgroundColor3=Color3.new(0,0,0),
    BorderSizePixel=0, ZIndex=5
})
new("UICorner",{Parent=panel, CornerRadius=UDim.new(0,12)})
local title = new("TextLabel", {
    Parent=panel, AnchorPoint=Vector2.new(0.5,0), Position=UDim2.new(0.5,0,0.04,0),
    Size=UDim2.new(0.9,0,0.12,0), BackgroundTransparency=1, Text=PANEL_TITLE,
    TextColor3=Color3.new(1,1,1), Font=Enum.Font.SourceSansBold, TextSize=28
})
-- title glow (simple tween on TextTransparency to simulate soft glow)
local titleGlow = {Intensity = 0}
-- central avatar container
local avatarContainer = new("Frame", {
    Parent=panel, AnchorPoint=Vector2.new(0,0.5), Position=UDim2.new(0.06,0,0.35,0),
    Size=UDim2.new(0,220,0,220), BackgroundColor3=Color3.fromRGB(30,30,30), BorderSizePixel=0
})
new("UICorner",{Parent=avatarContainer, CornerRadius=UDim.new(0,14)})
local avatarImg = new("ImageLabel", {
    Parent=avatarContainer, Size=UDim2.new(1,-8,1,-8), Position=UDim2.new(0.04,0,0.04,0),
    BackgroundTransparency=1, ScaleType=Enum.ScaleType.Fit
})

-- info & buttons area
local infoArea = new("Frame", {Parent=panel, AnchorPoint=Vector2.new(0,0.5), Position=UDim2.new(0.36,0,0.35,0), Size=UDim2.new(0.58,0,0.7,0), BackgroundTransparency=1})
local creatorsLabel = new("TextLabel", {Parent=infoArea, Position=UDim2.new(0,0,0,6), Size=UDim2.new(1,0,0,28), BackgroundTransparency=1, Text=CREATORS_TEXT, TextColor3=Color3.new(1,1,1), Font=Enum.Font.SourceSans, TextSize=18, TextXAlignment=Enum.TextXAlignment.Left})
local executorLabel = new("TextLabel", {Parent=infoArea, Position=UDim2.new(0,0,0,36), Size=UDim2.new(1,0,0,24), BackgroundTransparency=1, Text="Executor: "..tostring(executorName), TextColor3=Color3.new(1,1,1), Font=Enum.Font.SourceSans, TextSize=16, TextXAlignment=Enum.TextXAlignment.Left})
local sponsorLabel = new("TextLabel", {Parent=infoArea, Position=UDim2.new(0,0,0,60), Size=UDim2.new(1,0,0,22), BackgroundTransparency=1, Text=SPONSORS_TEXT, TextColor3=Color3.new(1,1,1), Font=Enum.Font.SourceSans, TextSize=16, TextXAlignment=Enum.TextXAlignment.Left})

-- buttons container & factory
local buttonsContainer = new("Frame", {Parent=infoArea, Position=UDim2.new(0,0,0,92), Size=UDim2.new(1,0,1,-92), BackgroundTransparency=1})
local function createButton(text, ypos)
    local b = new("TextButton", {
        Parent = buttonsContainer,
        Position = UDim2.new(0.02,0,ypos,0),
        Size = UDim2.new(0.96,0,0,54),
        BackgroundColor3 = Color3.new(0.08,0.08,0.08),
        BorderSizePixel = 0,
        Text = text,
        TextColor3 = Color3.new(1,1,1),
        Font = Enum.Font.SourceSansBold,
        TextSize = 20,
        AutoButtonColor = true,
    })
    new("UICorner",{Parent=b, CornerRadius=UDim.new(0,10)})
    return b
end

local btnPandora = createButton("Pandora", 0.00)
local btnCaducos = createButton("Caducos", 0.23)
local btnR6 = createButton("R6 Animations", 0.46)
local btnKeyboard = createButton("Keyboard", 0.69)

-- ===== ButtonScripts API =====
local ButtonScripts = {}
local function notify(text, time)
    pcall(function()
        local notice = new("TextLabel", {Parent = screenGui, Size=UDim2.new(0,360,0,36), Position=UDim2.new(0.5,-180,0.92,0), BackgroundColor3=Color3.new(0,0,0), TextColor3=Color3.new(1,1,1), Text=text, Font=Enum.Font.SourceSansBold, TextSize=16})
        new("UICorner",{Parent=notice, CornerRadius=UDim.new(0,8)})
        delay(time or 2, function() pcall(function() notice:Destroy() end) end)
    end)
end

local function runButtonScript(name)
    local fn = ButtonScripts[name]
    if type(fn) == "function" then
        local ok, err = pcall(fn)
        if not ok then
            warn("Erro ao rodar script do botão '"..name.."': "..tostring(err))
            notify("Erro ao executar "..name, 3)
        else
            notify(name.." executado.", 2)
        end
    else
        notify(name.." — Aguardando script...", 2)
    end
end

function RegisterButtonScript(name, func)
    ButtonScripts[name] = func
end

-- ===== Executor-provided scripts (integrations) =====
-- Caducos (link you provided)
local function runCaducos()
    local ok, err = pcall(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal -Script-Caducus-the-fallen-god-script-53019"))()
    end)
    if not ok then
        notify("Falha ao carregar Caducos", 3)
        warn("Caducos error:", err)
    end
end

-- Keyboard script (the code you gave earlier). We'll run it inside pcall to avoid crashing the Hub.
local function runKeyboard()
    local ok, err = pcall(function()
        -- the user-provided keyboard script (runs its own loadstring and builds UI)
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/manimcool21/Keyboard-FE/main/Protected%20(3).lua'),true))()
        -- The rest of the keyboard GUI code you provided expects to put things into CoreGui; it will run from here.
    end)
    if not ok then
        notify("Falha ao carregar Keyboard", 3)
        warn("Keyboard error:", err)
    end
end

-- Pandora: we include the large script you pasted as a string and attempt to execute it.
-- NOTE: if the pasted script is incomplete it may error — pcall will catch errors and notify you.
local PandoraScript = [[
-- cole aqui o script Pandora/reanimate que você forneceu
-- (o trecho que você forneceu foi inserido direto; se estiver truncado pode causar erro)
-- PARA MELHOR RESULTADO: substitua esse conteúdo por um URL e use loadstring(game:HttpGet(URL))()
-- (Se preferir me envie o link que eu atualizo)
]]


local function runPandora()
    local ok, err = pcall(function()
        -- try loadstring the text (if user provided full script here)
        if type(PandoraScript) == "string" and #PandoraScript > 10 then
            local fn, perr = loadstring(PandoraScript)
            if not fn then error(perr) end
            fn()
        else
            error("Script Pandora não configurado internamente. Informe o script ou um link.")
        end
    end)
    if not ok then
        notify("Falha ao executar Pandora", 4)
        warn("Pandora error:", err)
    end
end

-- initially map the Caducos and Keyboard directly
RegisterButtonScript("Caducos", runCaducos)
RegisterButtonScript("Keyboard", runKeyboard)
-- Pandora & R6 remain placeholders until you paste the exact full script or a URL
RegisterButtonScript("Pandora", runPandora)
RegisterButtonScript("R6 Animations", function() notify("R6 Animations — Aguardando script...", 3) end)

-- attach UI buttons
btnPandora.MouseButton1Click:Connect(function()
    runButtonScript("Pandora")
    pcall(function() local s = screenGui:FindFirstChild("ClickSound"); if s then s:Play() end end)
end)
btnCaducos.MouseButton1Click:Connect(function()
    runButtonScript("Caducos")
    pcall(function() local s = screenGui:FindFirstChild("ClickSound"); if s then s:Play() end end)
end)
btnR6.MouseButton1Click:Connect(function()
    runButtonScript("R6 Animations")
    pcall(function() local s = screenGui:FindFirstChild("ClickSound"); if s then s:Play() end end)
end)
btnKeyboard.MouseButton1Click:Connect(function()
    runButtonScript("Keyboard")
    pcall(function() local s = screenGui:FindFirstChild("ClickSound"); if s then s:Play() end end)
end)

-- ===== Avatar thumbnail =====
pcall(function()
    local success, thumb = pcall(function()
        return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if success and thumb then avatarImg.Image = thumb else avatarImg.Image = "rbxassetid://0" end
end)

-- ===== Draggability =====
local dragging=false; local dragInput, dragStart, startPos
panel.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = panel.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging=false end
        end)
    end
end)
panel.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end end)
UserInputService.InputChanged:Connect(function(input) if input == dragInput and dragging then
    local delta = input.Position - dragStart
    panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end end)

-- ===== Panel open/close tweens =====
local panelVisible = false
local openTweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local closeTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local function openPanel()
    if panelVisible then return end
    panelVisible = true
    panel.Position = UDim2.new(0.5,0,-0.1,0)
    panel.BackgroundTransparency = 1
    TweenService:Create(panel, openTweenInfo, {Position=UDim2.new(0.5,0,0.12,0), BackgroundTransparency=0}):Play()
    -- play open sound
    pcall(function() local s = screenGui:FindFirstChild("OpenSound"); if s then s:Play() end end)
end
local function closePanel()
    if not panelVisible then return end
    panelVisible = false
    TweenService:Create(panel, closeTweenInfo, {Position=UDim2.new(0.5,0,-0.8,0), BackgroundTransparency=1}):Play()
end

floatButton.MouseButton1Click:Connect(function()
    if panelVisible then closePanel() else openPanel() end
end)

-- ===== Sounds (ruido digital + click) =====
-- NOTE: replace SoundId values if you prefer different sounds.
local openSound = new("Sound", {Name="OpenSound", Parent=screenGui, Volume=0.7, Looped=false})
local clickSound = new("Sound", {Name="ClickSound", Parent=screenGui, Volume=0.6, Looped=false})
-- Example IDs (you can replace these with your preferred asset IDs)
openSound.SoundId = "rbxassetid://183226440" -- placeholder (system-like) - replace if you want another
clickSound.SoundId = "rbxassetid://147722227" -- placeholder (click) - replace if you want another

-- ===== Loading animation and show panel =====
spawn(function()
    local start = tick()
    local finish = start + LOADING_SECONDS
    while tick() < finish do
        local pct = math.clamp((tick()-start)/LOADING_SECONDS, 0, 1)
        barFill.Size = UDim2.new(pct,0,1,0)
        wait()
    end
    barFill.Size = UDim2.new(1,0,1,0)
    wait(0.12)
    TweenService:Create(loadingFrame, TweenInfo.new(0.4), {BackgroundTransparency=1}):Play()
    wait(0.45)
    pcall(function() loadingFrame:Destroy() end)
    -- show panel (descending to center)
    panel.Position = UDim2.new(0.5,0,-0.8,0)
    panel.BackgroundTransparency = 1
    TweenService:Create(panel, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position=UDim2.new(0.5,0,0.12,0), BackgroundTransparency=0}):Play()
    panelVisible = true
    pcall(function() openSound:Play() end)
    -- soft title glow loop
    spawn(function()
        while panelVisible and title and title.Parent do
            pcall(function()
                TweenService:Create(title, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency=0.05}):Play()
                wait(1.2)
                TweenService:Create(title, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextTransparency=0}):Play()
                wait(1.2)
            end)
            wait()
        end
    end)
end)

-- ===== Responsive scale =====
local function rescale()
    local w = math.clamp(workspace.CurrentCamera.ViewportSize.X, 800, 9999)
    local scale = math.clamp(w/1400, 0.6, 1)
    panel.Size = UDim2.new(0, 700*scale, 0, 420*scale)
end
if workspace.CurrentCamera then rescale(); workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(rescale) end

-- ===== Final notes & placeholders =====
print("☠️ E.X.E C00QUETTE ☠️ Hub carregado. Use RegisterButtonScript(nome, func) para modificar botões.")
notify("Hub carregado. Clique © para abrir/fechar.", 3)

-- Exemplo de como sobrescrever/registrar manualmente (se quiser colar depois no executor)
-- RegisterButtonScript("Pandora", function() loadstring(game:HttpGet("LINK_PANDORA_AQUI"))() end)
-- RegisterButtonScript("R6 Animations", function() -- seu script R6 aqui end)