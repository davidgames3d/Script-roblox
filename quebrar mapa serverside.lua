-- Script: Formador de Quadrado
-- Autor: Davidgames3d V 💥

local pontoCentral = Vector3.new(0, 50, 0) -- ponto para onde os objetos serão puxados
local distanciaEntre = 20 -- espaço entre os blocos na forma final (quadrado)
local tamanhoQuadrado = 5 -- quantidade de partes em cada lado
local velocidade = 2 -- velocidade do movimento

-- Pega todas as partes do mapa (pode ajustar pra pegar apenas as que quiser)
local partes = workspace:GetDescendants()
local blocos = {}

for _, obj in ipairs(partes) do
	if obj:IsA("BasePart") and obj.Anchored == false then
		table.insert(blocos, obj)
	end
end

print("Blocos detectados: " .. #blocos)

-- Cria uma função de movimento suave
local function moverSuavemente(parte, destino)
	local tweenService = game:GetService("TweenService")
	local info = TweenInfo.new((parte.Position - destino).Magnitude / velocidade, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local tween = tweenService:Create(parte, info, {Position = destino})
	tween:Play()
end

-- Fase 1: puxar tudo para o ponto central
for _, p in ipairs(blocos) do
	moverSuavemente(p, pontoCentral + Vector3.new(math.random(-10,10), math.random(-10,10), math.random(-10,10)))
end

task.wait(5)

-- Fase 2: formar o quadrado gigante
local index = 1
for x = 1, tamanhoQuadrado do
	for z = 1, tamanhoQuadrado do
		if blocos[index] then
			local destino = pontoCentral + Vector3.new((x - tamanhoQuadrado/2) * distanciaEntre, 0, (z - tamanhoQuadrado/2) * distanciaEntre)
			moverSuavemente(blocos[index], destino)
			index += 1
		end
	end
end