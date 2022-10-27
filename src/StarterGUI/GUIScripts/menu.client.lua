-- Declare variables
local Players = game:GetService("Players")

-- Daily bonus button variables
local dailyBonusButton = Players.LocalPlayer.PlayerGui.Menu.Menu.DailyBonus_Roundify_12px.DailyBonus
local dailyBonusImage = dailyBonusButton.Parent
local defaultColor = Color3.new(0.717647, 1, 0.298039)
local selectedColor = Color3.new(0.568627, 0.776471, 0.231373)
local bonusEvent = game:GetService("ReplicatedStorage").Events:WaitForChild("claimDailyBonus")
local canClaim = true
local utilsModule = require(game:GetService("ReplicatedStorage").MyModules:WaitForChild("utils"))

-- Frame tweening
local frame = dailyBonusImage.Parent
local openCloseGUI = frame.OpenCloseGUI
local isOpen = false
local openTime = 0.5 -- Seconds

-- Daily bonus button functions
dailyBonusButton.MouseButton1Down:Connect(function()
	dailyBonusImage.ImageColor3 = selectedColor
    if canClaim then
        canClaim = false
        bonusEvent:FireServer()

        task.wait(2)

        for i = 10, 0, -1 do
            task.wait(1)
            dailyBonusButton.Text = "Try again in " .. i .. " seconds."
        end

        dailyBonusButton.Text = "Claim daily 20 dollars"
        canClaim = true
    end
end)

dailyBonusButton.MouseLeave:Connect(function()
	dailyBonusImage.ImageColor3 = defaultColor
end)

dailyBonusButton.MouseButton1Up:Connect(function()
	dailyBonusImage.ImageColor3 = defaultColor
end)

-- Daily bonus remote event handling
bonusEvent.OnClientEvent:Connect(function(secondsLeft)
    if secondsLeft == "Success! 20 dollars claimed." then
        dailyBonusButton.Text = secondsLeft
        game.ReplicatedStorage.Audio.coins_purchase:Play()
    else
        local timeLeft = utilsModule.secToTime(secondsLeft)
        dailyBonusButton.Text = "Time left: " .. timeLeft
        game.ReplicatedStorage.Audio.error_sound:Play()
    end
end)

-- GUI tweening
openCloseGUI.MouseButton1Click:Connect(function()
    if not isOpen then
        openCloseGUI.Text = "<"
        frame:TweenPosition(
            UDim2.new(0.5, 0, 0.4, 0),
            Enum.EasingDirection.In,
            Enum.EasingStyle.Quad,
            openTime,
            false,
            nil
        )
        task.wait(openTime)
        isOpen = true
    else
        openCloseGUI.Text = ">"
        frame:TweenPosition(
            UDim2.new(-0.25, 0, 0.4, 0),
            Enum.EasingDirection.In,
            Enum.EasingStyle.Quad,
            openTime,
            false,
            nil
        )
        task.wait(openTime)
        isOpen = false
    end
end)

