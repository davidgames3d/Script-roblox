-- Altere este valor para a velocidade que você quiser
local novaVelocidade = 999 -- padrão é 16

-- Pega o personagem local
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Altera a velocidade
humanoid.WalkSpeed = novaVelocidade

print("Velocidade alterada para:", novaVelocidade)