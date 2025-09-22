-- Lista de keys válidas (pode ser aleatória ou gerada pra cada usuário)
local validKeys = {
    "aofn19kh", 
    "apxnqodnw", 
    "10372947"
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

-- Aqui você coloca a key que o usuário digita ou que você fornece
local userInputKey = "VIP123" -- Exemplo, você pode pedir input via TextBox

if checkKey(userInputKey) then
    -- Se a key for válida, roda o loadstring VIP
    loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DARK%20HUB%20VIP%E2%AD%90%20version.lua"))()
    print("Key aceita! Rodando Dark HUB VIP⭐")
else
    -- Se a key for inválida
    warn("Key inválida! Você não tem acesso à versão VIP.")
end