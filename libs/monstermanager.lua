local pathToMonsters = "graphics/monster/"
local monsterTable = {
    testman = {
        pathToMonsters.."testman", 3
    }
}

local function getMonster(index)
    return monsterTable[index]
end

return{
    get = getMonster
}
