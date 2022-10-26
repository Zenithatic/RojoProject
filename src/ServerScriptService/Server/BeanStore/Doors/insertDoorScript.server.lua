-- Declare variables
local door1 = game.Workspace.BeansStore.Door
local door2 = game.Workspace.BeansStore.Door2

local script = script.Parent.doorDetection

-- Insert scripts into doors
local script1 = script:Clone()
script1.Parent = door1
script1.Enabled = true

local script2 = script:Clone()
script2.Parent = door2
script2.Enabled = true