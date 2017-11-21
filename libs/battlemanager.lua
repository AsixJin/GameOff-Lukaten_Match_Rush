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
B_DAMAGE_STATE = 5

local battleState = B_INTRO_STATE

local monsterName = ""
local monsterSprite = ""
local monsterXPos = 95
local monsterYPos = 64
local monsterCombo = {}
local guessCombo = {}
local playerCombo = {}
local winCheck

local function generateCombo(maxCombo)
    for i=1,maxCombo do
        table.insert(monsterCombo, love.math.random(1, 4))
        table.insert(guessCombo, 5)
    end
end

local function resetBattleManager()
    battleState = B_INTRO_STATE

    monsterName = ""
    monsterSprite = ""

    monsterCombo = {}
    guessCombo = {}
    playerCombo = {}
    winCheck = nil
end

local function startBattle(monster)
    -- Reset Manager
    resetBattleManager()
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
    if battleState ~= B_INTRO_STATE then
        for i=1,#monsterCombo do
            love.graphics.draw(love.graphics.newImage("graphics/markers/"..guessCombo[i]..".png"), 27*i, 225)
        end
    end

    if battleState == B_INPUT_STATE then
        for i=1,#playerCombo do
            love.graphics.draw(love.graphics.newImage("graphics/markers/"..playerCombo[i]..".png"), 27*i, 355)
        end
    end
end

local function addToPlayerGuess(num)
    if #playerCombo < #monsterCombo then
        local guess = guessCombo[#playerCombo+1]
        if guess ~= 5 then
            table.insert(playerCombo, guess)
        else
            table.insert(playerCombo, num)
        end


    end
end

local function winBattle()
    battleState = B_WIN_STATE
    dialogManager.setText("You have beaten\n"..monsterName)
end

local function loseBattle()
    battleState = B_LOSE_STATE
    dialogManager.setText(monsterName.."\nhad defeated you...")
end

local function monsterAttack()
    battleState = B_DAMAGE_STATE
    local damage = love.math.random(1, 5)
    player.modHP(false, damage)
    dialogManager.setText("You've lost "..damage.." HP!")
end

local function checkWin(numberRight)
    local hasWon = false

    if numberRight == #monsterCombo then
        hasWon = true
    end

    winCheck = hasWon
end

local function checkSequence()
    local numRight = 0

    if #playerCombo == #monsterCombo then
        battleState = B_CHECK_STATE
        for i=1,#monsterCombo do
            if monsterCombo[i] == playerCombo[i] then
                guessCombo[i] = monsterCombo[i]
                numRight = numRight + 1
            end
        end

        playerCombo = {}

        if numRight > 0 then
            dialogManager.setText(monsterName.."\ntook damage!")
        else
            dialogManager.setText(monsterName.."\ndodge the attack!")
        end

        checkWin(numRight)
    end
end

local function keypressed(key)
    local guessNumber = 0

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
                guessNumber = checkSequence()
            elseif key == "s" then
                table.remove(playerCombo, #playerCombo)
            end
        elseif battleState == B_CHECK_STATE then
            if key == "a" then
                if winCheck  then
                    winBattle()
                elseif not winCheck then
                    monsterAttack()
                end
                winCheck = nil
            end
        elseif battleState == B_DAMAGE_STATE then
            if key == "a" then
                if player.getHP() > 0 then
                    battleState = B_INPUT_STATE
                else
                    loseBattle()
                end
            end
        elseif battleState == B_WIN_STATE then
            if key == "a" then
                gManager.changeState(BOARD_STATE)
                resetBattleManager()
            end
        elseif battleState == B_LOSE_STATE then
            if key == "a" then
                -- Restart the game
                love.event.quit("restart")
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