-- include this script inside Bridge object

local bridge = script.Parent
local isTouched = true

-- Function to fade the bridge
local function fade()

    while isTouched == true do

        -- Set isTouched to false to prevent further touches for 5 seconds
        isTouched = false
        wait(5)

        -- Gradually make the bridge more transparent
        for count = 1, 10 do

            -- Fade out the bridge based on the loop count
            bridge.Transparency = count / 10
            wait(0.1)

        end

        -- Disable collision for the bridge for 5 seconds
        bridge.CanCollide = false
        wait(5)

        -- Enable collision again
        bridge.Transparency = 0
        bridge.CanCollide = true

        -- Allow the bridge to be touched again
        isTouched = true

    end

end

-- Connect fade function to the Touched event of the bridge
bridge.Touched:Connect(fade)
