local player = game.Players.LocalPlayer
local frame = player.PlayerGui:WaitForChild("TimerGui").Frame
local timerEvent = game:GetService("ReplicatedStorage").GuiEvents.TimerEvent

-- Receive signal as client
timerEvent.OnClientEvent:Connect(function(number)

    -- Make the timer frame visible
    frame.Visible = true

    repeat
        frame.TimerLabel.Text = number
        number -= 1
        wait(1)
    until number == 0

    -- Make the timer frame invisible
    frame.Visible = false
    wait(1)

end)
