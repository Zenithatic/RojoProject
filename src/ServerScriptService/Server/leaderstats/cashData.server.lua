-- Declare variables
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local cashDataStore = DataStoreService:GetDataStore("RojoProjectCashData")

-- Run code when player joins
Players.PlayerAdded:Connect(function(player)
    -- Setup leaderboard statistics
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    -- Add cash value
    local cashStat = Instance.new("IntValue")
    cashStat.Name = "Cash"
    cashStat.Parent = leaderstats

    -- Try to get existing data
    local success, errormessage = pcall(function()
        local data = cashDataStore:GetAsync(player.UserId)
        if data ~= nil then
            cashStat.Value = data
        end
    end)
    if not success then
        print(errormessage)
    end

end)

-- Run code when player exits
Players.PlayerRemoving:Connect(function(player)
    -- Attempt to save data
    local success, errormessage = pcall(function()
        local cashToStore = player.leaderstats.Cash.Value
        cashDataStore:SetAsync(player.UserId, cashToStore)
    end)
    if not success then
        print(errormessage)
    end
end)