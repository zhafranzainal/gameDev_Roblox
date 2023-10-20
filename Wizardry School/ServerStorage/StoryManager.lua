-- This is a ModuleScript
-- Define a module for managing a game story
local StoryManager = {}

local DialogueEvent = game:GetService("ReplicatedStorage").GuiEvents.DialogueEvent

-- Reference to the NPC model
local npcModel = game.Workspace.Wulfric
local npcImage = "rbxassetid://8856044080"
local npcName = npcModel.Name

-- Send signal as server
local function task1()

    DialogueEvent:FireAllClients(npcImage, npcName, "Welcome to Wizardry School!")
    wait(5)

    DialogueEvent:FireAllClients(npcImage, npcName, "I am Professor Wulfric.")
    wait(3)

    DialogueEvent:FireAllClients(npcImage, npcName, "Since it is your first day of school..")
    wait(5)

    DialogueEvent:FireAllClients(npcImage, npcName, ".. I will lead you to join the first class as an introduction.")
    wait(6)

    DialogueEvent:FireAllClients(npcImage, npcName, "Feel free to explore the castle while I'm preparing the class.")
    wait(7)

end

function StoryManager.startStory()
    wait(10)
    task1()
    wait(30)
end

-- Return the StoryManager module for external use
return StoryManager
