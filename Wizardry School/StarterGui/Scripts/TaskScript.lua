local player = game.Players.LocalPlayer
local frame = player.PlayerGui:WaitForChild("TaskGui").Frame
local taskEvent = game:GetService("ReplicatedStorage").GuiEvents.TaskEvent

-- Receive signal as client
taskEvent.OnClientEvent:Connect(function(task)

    -- Make the task frame visible
    frame.Visible = true

    -- Set task
    frame:WaitForChild("TaskLabel").Text = task

end)
