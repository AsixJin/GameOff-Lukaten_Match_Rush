-- CONST
BR_START_STATE = 0
BR_ROLL_STATE = 1
BR_MOVE_STATE = 2
BR_ACTION_STATE = 3

BR_ACTION_BATTLE = 40
BR_ACTION_MOVE = 70
BR_ACTION_HP = 85

local boardState = BR_START_STATE
local boardSprite

local dieRoll = 1

local function rollDie()
    dieRoll = love.math.random(1, 6);
    local didMove = player.move(dieRoll)
    boardState = BR_MOVE_STATE
    if didMove then
        dialogManager.setText("Roku has moved "..dieRoll.." spaces!")
    else
        dialogManager.setText("Roku couldn't move\n"..dieRoll.." spaces.")
    end
end

local function rollAction()
    local actionRoll = love.math.random(1, 100)
    boardState = BR_ACTION_STATE

    if player.getBP() ~= 30 then
        if actionRoll <= BR_ACTION_BATTLE then
            battleManager.startBattle(monsterManager.get(love.math.random(1, 13)))
            boardState = BR_ROLL_STATE
        elseif actionRoll <= BR_ACTION_MOVE then
            local forward = love.math.random(1, 2) -- Are you moving forward or back
            local movement = love.math.random(1, 6) -- How are
            if forward == 1 then
                player.move(movement)
                dialogManager.setText("Roku goes forward\n"..movement.." spaces!")
            else
                player.back(movement)
                dialogManager.setText("Roku goes back\n"..movement.." spaces!")
            end
        elseif actionRoll <= BR_ACTION_HP then
            local gain = love.math.random(1, 2) -- Are you losing or gaining health
            local amount = love.math.random(1, 6) --How much are you
            if gain == 1 then
                player.modHP(true, amount)
                dialogManager.setText("Roku gains\n"..amount.." health!")
            else
                player.modHP(false, amount)
                dialogManager.setText("Roku loses\n"..amount.." health!")
            end
        else
            dialogManager.setText("Roku did nothing...")
        end
    else
        battleManager.startBattle(monsterManager.get(14))
    end

end

local function load()
    -- Init Game Board
    boardSprite = love.graphics.newImage("maps/debug.png")
end

local function update(dt)
    if boardState == BR_START_STATE then
        dialogManager.setText("Lukaten Match Rush\nPress 'A' to start!")
    elseif boardState == BR_ROLL_STATE then
        dialogManager.setText("Press 'A' to roll the die!")
    end
end

local function draw()
    -- Draw Game Board
    love.graphics.draw(boardSprite, 0, 0)
end

local function keypressed(key)
    if gManager.getState() == BOARD_STATE then
        if key == "a" then
            if boardState == BR_START_STATE then
                boardState = BR_ROLL_STATE
            elseif boardState == BR_ROLL_STATE then
                rollDie()
            elseif boardState == BR_MOVE_STATE then
                rollAction()
            elseif boardState == BR_ACTION_STATE then
                boardState = BR_ROLL_STATE
            end
        end
    end
end

return{
    load = load,
    update = update,
    draw = draw,
    keypress = keypressed
}
