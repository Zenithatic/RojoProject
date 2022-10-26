-- Declare variables
local RunService = game:GetService("RunService")

local radio = game.Workspace.BeansStore.Radio
local audio = radio.MainSpeaker["Life in an Elevator"]

local mainSpeaker = radio.MainSpeaker
local speaker1 = radio.Speaker
local speaker2 = radio.Speaker1
local sv3 = speaker1.Size
local msv3 = mainSpeaker.Size

-- Run code each frame
RunService.Heartbeat:Connect(function()
    
    -- Get loudness of audio 
    local loudness = audio.PlaybackLoudness * 0.0005

    -- Change sizes of speakers relative to loudness to simulate "booming"
    mainSpeaker.Size = Vector3.new(msv3.X + loudness, msv3.Y + loudness, msv3.Z + loudness)
    speaker1.Size = Vector3.new(sv3.X + loudness, sv3.Y + loudness, sv3.Z + loudness)
    speaker2.Size = Vector3.new(sv3.X + loudness, sv3.Y + loudness, sv3.Z + loudness)
end)

