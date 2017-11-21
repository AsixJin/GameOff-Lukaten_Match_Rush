-- Const
UP_CMD = 1
RIGHT_CMD = 2
DOWN_CMD = 3
LEFT_CMD = 4

-- Const Battle State
B_INTRO_STATE = 0
B_INPUT_STATE = 1
B_CHECK_STATE = 2
B_WIN_STATE = 3
B_LOSE_STATE = 4

local battleState = B_INTRO_STATE

local monsterName = ""
local monsterSprite = ""
local monsterXPos = 95
local monsterYPos = 64
local monsterCombo = {}
local guessCombo = {}
local playerCombo = {}

local function generateCombo(maxCombo)
    for i=1,maxCombo do
        table.insert(monsterCombo, love.math.random(1, 4))
        table.insert(guessCombo, 5)
    end
end

local function startBattle(monster)
    -- Change the Game State to Battle
    gManager.changeState(BATTLE_STATE)
    -- Change the Battle State to Start
    monsterName = monster[1]
    -- Load Monster Sprite
    monsterSprite = love.graphics.newImage(monster[2])
    -- Randomize Monster's Combo
    generateCombo(monster[3])
    -- Display Start Text
    dialogManager.setText(monsterName.."\nhas challenge you to battle")
end

local function update(dt)
    if battleState == B_INPUT_STATE then
        dialogManager.setText("Input Combo!")
    end
end

local function draw()
    love.graphics.draw(monsterSprite, monsterXPos, monsterYPos)
    if battleState == B_INPUT_STATE then
        for i=1,#monsterCombo do
            love.graphics.draw(love.graphics.newImage("graphics/markers/"..guessCombo[i]..".png"), 27*i, 225)
        end

        for i=1,#playerCombo do
            love.graphics.draw(love.graphics.newImage("graphics/markers/"..playerCombo[i]..".png"), 27*i, 355)
        end
    end
end

local function addToPlayerGuess(num)
    if #playerCombo < #monsterCombo then
        table.insert(playerCombo, num)
    end
end

local function checkSequence()
    if #playerCombo == #monsterCombo then
        for i=1,#monsterCombo do
            if monsterCombo[i] == playerCombo[i] then
                guessCombo[i] = monsterCombo[i]
            end
        end

        playerCombo = {}
    end
end

local function checkWin()
    local hasWon = true

    for i=1,#guessCombo do
        if guessCombo[i] == 5 then
            hasWon = false
        end
    end

    return hasWon
end

local function keypressed(key)
    if gManager.getState() == BATTLE_STATE then
        if battleState == B_INTRO_STATE then
            if key == "a" then
                battleState = B_INPUT_STATE
            end
        elseif battleState == B_INPUT_STATE then
            if key == "up" then
                addToPlayerGuess(1)
            elseif key == "right" then
                addToPlayerGuess(2)
            elseif key == "down" then
                addToPlayerGuess(3)
            elseif key == "left" then
                addToPlayerGuess(4)
            elseif key == "a" then
                -- Accept Combo, Move to check state
                checkSequence()
            elseif key == "s" then
                table.remove(playerCombo, #playerCombo)
            end
        end
    end
end



return{
    update = update,
    draw = draw,
    startBattle = startBattle,
    keypress = keypressed
}