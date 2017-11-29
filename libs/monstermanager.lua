local pathToMonsters = "graphics/monster/"
local monsterTable = {
    {"Slime", pathToMonsters.."slime"..".png", 2, false},
    {"Bee", pathToMonsters.."bee"..".png", 3, false},
    {"Thief", pathToMonsters.."thiefN"..".png", 5, false},
    {"Thief", pathToMonsters.."thiefF"..".png", 5, false},
    

    {"Golem", pathToMonsters.."golem"..".png", 10, false},
    {"Testman", pathToMonsters.."testman"..".png", 3, false},
    {"Name", "Path to Sprite", "Max Combo", "Bool-Is it a boss"} --This is an example
}

local function getMonster(index)
    return monsterTable[index]
end

return{
    get = getMonster
}
