local main
local inDebug = false

local function debugLoad(isDebug)
    inDebug = isDebug
end

local function debugUpdate(dt)
    if inDebug == true then
        --Testing Display
        if love.keyboard.isDown("1") then
            dialogManager.getDDialog(1)
        elseif love.keyboard.isDown("2") then
            dialogManager.getDDialog(2)
        end
    end
end

local function debugDraw()
end

function love.keypressed(key)
    if key == "3" then
        if gManager.getState() == BOARD_STATE then
            gManager.changeState(BATTLE_STATE)
        else
            gManager.changeState(BOARD_STATE)
        end
    end

    if key == "4" then
        player.move(1)
    end
end

return{
    load = debugLoad,
    update = debugUpdate,
    draw = debugDraw
}