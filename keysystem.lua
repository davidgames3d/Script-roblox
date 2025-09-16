-- Carrega a Redz Library
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

-- Lista de keys VIP válidas
local validKeys = {
    "1997_21@#jwn",
    "savid&aps9d",
    "aoc19!_9qonc",
    -- adicione outras keys para parceiros/amigos
}

-- Função que pede a Key ao jogador
local function AskKey()
    local key = redzlib:Prompt("Acesso", "Digite sua key para acessar o Dark Hub:")
    if table.find(validKeys, key) then
        redzlib:Notify("Acesso concedido", "Bem-vindo ao Dark Hub!", 5)
        return true
    else
        redzlib:Notify("Acesso negado", "Key inválida. pegue a Key com o Criador ou no canal.", 5)
        return false
    end
end

-- Executa o hub somente se a key estiver correta
if AskKey() then

  loadstring(game:HttpGet("https://raw.githubusercontent.com/davidgames3d/Script-roblox/main/DARKHUB🐺.lua"))()