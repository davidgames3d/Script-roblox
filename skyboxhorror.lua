    if game.Lighting:FindFirstChildOfClass("Sky") then
        game.Lighting:FindFirstChildOfClass("Sky"):Destroy()
    end
    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://18450062749"
    sky.SkyboxDn = "rbxassetid://18450062749"
    sky.SkyboxFt = "rbxassetid://18450062749"
    sky.SkyboxRt = "rbxassetid://18450062749"
    sky.SkyboxUp = "rbxassetid://18450062749"
    sky.SkyboxLf = "rbxassetid://18450062749"
    sky.Parent = game.Lighting