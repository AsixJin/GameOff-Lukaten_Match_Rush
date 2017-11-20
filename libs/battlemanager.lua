-- Const
UP_CMD = 0
RIGHT_CMD = 1
DOWN_CMD = 2
LEFT_CMD = 3

local battleState = 0

local monsterSprite = ""
local monsterXPos = 0
local monsterYPos = 0
local monsterCombo = {}
local playerCombo = {}

local function startBattle(monster)
    -- Change the Game State to Battle
    gManager.changeState(BATTLE_STATE)
    -- Change the Battle State to Start
    monsterSprite = monster[1]
    -- Load Monster Sprite
    -- Randomize Monster's Combo
end

local function update(dt)
end

local function draw()
    love.graphics.draw(monsterSprite, monsterXPos, monsterYPos)
end

local function keypressed(key)
    if gManager.getState() == BATTLE_STATE then
        if key == "5" then
            dialogManager.getDDialog(3)
        end
    end
end

return{
    startBattle = startBattle,
    keypress = keypressed
}