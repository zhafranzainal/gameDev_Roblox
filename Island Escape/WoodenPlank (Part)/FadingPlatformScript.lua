local woodenPlank = script.Parent

wait(10)
woodenPlank.BrickColor = BrickColor.new("Artichoke")

-- As long as the game is running
while true do

    for count = 1, 10 do
        -- Part gradually disappears
        woodenPlank.Transparency = count / 10
        wait(1)
    end

    -- Part no longer can be stepped on for 3 seconds
    woodenPlank.CanCollide = false
    wait(3)

    -- Part reappears and can be stepped on again for 5 seconds
    woodenPlank.Transparency = 0
    woodenPlank.CanCollide = true
    wait(5)

end
