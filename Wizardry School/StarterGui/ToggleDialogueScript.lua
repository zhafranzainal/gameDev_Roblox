local ToggleDialogueEvent = game:GetService("ReplicatedStorage").ToggleEvents.ToggleDialogueEvent
local frame = script.Parent.Frame

ToggleDialogueEvent.OnClientEvent:Connect(function(toggle)

    if toggle == true then
        frame.Visible = true
    elseif toggle == false then
        frame.Visible = false
    end

end)
