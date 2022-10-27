-- Declare variables
local pp = game.Workspace.BeansStore.Cashier.Torso.BuyBeans
local beans = game:GetService("ReplicatedStorage").Tools:WaitForChild("Beans")
local buyAudio = game.Workspace.BeansStore["Cash Register"].Union1.coins_purchase
local errorAudio = game.Workspace.BeansStore["Cash Register"].Union1.error_sound

-- Listen for proximity prompt trigger
pp.Triggered:Connect(function(player)
    -- Check if player already has beans
    if player.Backpack:FindFirstChild("Beans") or player.Character:FindFirstChild("Beans") then
        return
    end

    -- Check if player has enough money
    local cash = player.leaderstats.Cash.Value
    
    if cash >= 1 then
        -- Give player beans and deduct 1 dollar
        local newBeans = beans:Clone()
        newBeans.Parent = player.Backpack
        buyAudio:Play()
        player.leaderstats.Cash.Value -= 1
    else
        errorAudio:Play()
    end
end)