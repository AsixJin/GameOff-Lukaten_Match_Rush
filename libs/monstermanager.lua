local pathToMonsters = "graphics/monster/"
local monsterTable = {
    {"Slime", pathToMonsters.."slime"..".png", 2, false},
    {"Owl", pathToMonsters.."owl"..".png", 2, false},
    {"Demon Flower", pathToMonsters.."poisonflower"..".png", 2, false},
    {"Bee", pathToMonsters.."bee"..".png", 3, false},
    {"Snake", pathToMonsters.."snake"..".png", 3, false},
    {"Scorpion", pathToMonsters.."Scorpion"..".png", 4, false},
    {"Thief", pathToMonsters.."thiefM"..".png", 5, false},
    {"Thief", pathToMonsters.."thiefF"..".png", 5, false},
    {"Angry Turtle", pathToMonsters.."Turtle"..".png", 6, false},
    {"Wolf", pathToMonsters.."wolf"..".png", 6, false},
    {"Harpy", pathToMonsters.."harpy"..".png", 7, false},
    {"Hawk", pathToMonsters.."hawk"..".png", 7, false},
    {"Wisp", pathToMonsters.."wisp"..".png", 8, false},
    {"Golem", pathToMonsters.."golem"..".png", 10, true}, -- Final Boss
    {"Testman", pathToMonsters.."testman"..".png", 3, false}, -- Debug Monster
    {"Name", "Path to Sprite", "Max Combo", "Bool-Is it a boss"} -- DO NOT LOAD THIS
}

local function getMonster(index)
    return monsterTable[index]
end

return{
    get = getMonster
}
