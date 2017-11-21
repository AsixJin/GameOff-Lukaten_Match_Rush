local pathToMonsters = "graphics/monster/"
local monsterTable = {
    {"Name", "Path to Sprite", "Max Combo"},
    {"Testman Lv.1", pathToMonsters.."testman"..".png", 3},
    {"Testman Lv.2", pathToMonsters.."testman"..".png", 6},
    {"Testman Lv.3", pathToMonsters.."testman"..".png", 10}
}

local function getMonster(index)
    return monsterTable[index]
end

return{
    get = getMonster
}
