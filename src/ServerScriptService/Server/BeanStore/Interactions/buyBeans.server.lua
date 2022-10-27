-- Declare variables
local pp = game.Workspace.BeansStore.Cashier.Torso.BuyBeans
local beans = game:GetService("ReplicatedStorage").Tools:WaitForChild("Beans")
local buyAudio = game.Workspace.BeansStore["Cash Register"].Union1.coins_purchase

-- Listen for proximity prompt trigger
pp.Triggered:Connect(function(player)
    -- Check if player already has beans
    if player.Backpack:FindFirstChild("Beans") or player.Character:FindFirstChild("Beans") then
        return
    end

    -- Give player beans
    local newBeans = beans:Clone()
    newBeans.Parent = player.Backpack
    buyAudio:Play()
end)