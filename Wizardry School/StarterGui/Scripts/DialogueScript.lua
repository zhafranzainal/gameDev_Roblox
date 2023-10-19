local player = game.Players.LocalPlayer
local frame = player.PlayerGui:WaitForChild("DialogueGui").Frame
local dialogueEvent = game:GetService("ReplicatedStorage").GuiEvents.DialogueEvent

-- Function to animate text display
local function animateText(dialogue)

    for i = 1, #dialogue, 1 do

        -- Update the text one character at a time
        frame:WaitForChild("DialogueLabel").Text = string.sub(dialogue, 1, i)

        -- Wait a short interval for the next character to appear
        wait(0.04)

    end

end

-- Receive signal as client
dialogueEvent.OnClientEvent:Connect(function(playerImage, playerName, dialogue)

    -- Make the dialogue frame visible
    frame.Visible = true

    -- Set player image, player name, and animate the text display
    frame:WaitForChild("ImageLabel").Image = playerImage
    frame:WaitForChild("NameLabel").Text = playerName
    animateText(dialogue)

end)
