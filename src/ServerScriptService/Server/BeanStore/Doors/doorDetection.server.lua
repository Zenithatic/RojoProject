-- Declare variables
local audio = script.Parent.door_open
local angle = script.Parent.HingeConstraint.angle
local angleToPlaySound = 60
local canPlaySound = true

-- Check when angle changes, play open door if angle is at requirement
angle.Changed:Connect(function(value)
	if value <= angleToPlaySound and value >= -angleToPlaySound then
		canPlaySound = true
	elseif value >= angleToPlaySound or value <= -angleToPlaySound then
		if canPlaySound then
			audio.Playing = true
			canPlaySound = false
		end
	end
end)

