local utils = {}

-- Seconds to time function
utils.secToTime = function(seconds)
    -- Init
    local secondsLeft = seconds

    -- Find number of hours
    local hours = (secondsLeft - (secondsLeft % 3600)) / 3600
    secondsLeft = secondsLeft - (secondsLeft - (secondsLeft % 3600))

    -- Find number of minutes
    local minutes = (secondsLeft - (secondsLeft % 60)) / 60
    secondsLeft = secondsLeft - (secondsLeft - (secondsLeft % 60))

    local formattedHours = hours
    local formattedMinutes = minutes
    local formattedSeconds = secondsLeft

    -- Format time
    if hours < 10 then
        formattedHours = "0" .. hours
    end

    if minutes < 10 then
        formattedMinutes = "0" .. minutes
    end

    if secondsLeft < 10 then
        formattedSeconds = "0" .. secondsLeft
    end

    -- Return time string
    local timeString = formattedHours .. ":" .. formattedMinutes .. ":" .. formattedSeconds
    return timeString
end

return utils