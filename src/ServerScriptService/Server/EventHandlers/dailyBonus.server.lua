-- Declare variables
local bonusEvent = game:GetService("ReplicatedStorage").Events:WaitForChild("claimDailyBonus")
local DataStoreService = game:GetService("DataStoreService")
local dailyBonusDB = DataStoreService:GetDataStore("RojoProjectDailyBonus")
local dailyCash = 20
local timeNeeded = 12 * 60 * 60

bonusEvent.OnServerEvent:Connect(function(player)
    -- Check if player has not collected the daily bonus before
    local success, errormessage = pcall(function()
        local data = dailyBonusDB:GetAsync(player.UserId)

        if data == nil then
            -- Give player 20 dollars then set time collected to database
            player.leaderstats.Cash.Value += dailyCash
            dailyBonusDB:SetAsync(player.UserId, os.time())
        
        elseif os.time() - data >= timeNeeded then
            player.leaderstats.Cash.Value = player.leaderstats.Cash.Value + dailyCash
            dailyBonusDB:SetAsync(player.UserId, os.time())
            bonusEvent:FireClient(player, "Success! 20 dollars claimed.")
        else
            bonusEvent:FireClient(player, timeNeeded - (os.time() - data))
        end
    end)

    -- Output errors
    if not success then
        print(errormessage)
    end
end)