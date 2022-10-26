local RunService = game:GetService("RunService")

-- Declare variables
local beanDoor1 = game.Workspace.BeansStore.Door.HingeConstraint
local beanDoor2 = game.Workspace.BeansStore.Door2.HingeConstraint

-- Run code each frame render
RunService.Heartbeat:Connect(function()
    -- Update door angles
    beanDoor1.angle.Value = beanDoor1.CurrentAngle
    beanDoor2.angle.Value = beanDoor2.CurrentAngle
end)