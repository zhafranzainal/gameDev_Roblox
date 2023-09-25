-- Array
local gunArr = {"Gun", "Red", 50}

-- Dictionaries (Key-Value pairs)
local weaponDict = {
    Type = "Gun",
    Color = "Red",
    Damage = 50
}

-- Gun1: Access elements using numerical index
print(gunArr[1])

-- Access elements using keys
print(weaponDict.Type) -- Gun2: Dot notation
print(weaponDict["Type"]) -- Gun3: Bracket notation

print()

-- Loop1: Access elements using iteration from 1 to 3 with a step of 1
for i = 1, 3, 1 do
    print(gunArr[i])
end

print()

-- Loop2: Access elements using generic loop, where # is used to get the length of the array
for i = 1, #gunArr do
    print(gunArr[i])
end

print()

-- Loop3: For Array, iterate both index and value using ipairs()
for i, value in ipairs(gunArr) do
    print(i, value)
end

print()

-- Loop4: For Dictionaries, iterate both key and value using pairs()
for key, value in pairs(weaponDict) do
    print(key, value)
end
