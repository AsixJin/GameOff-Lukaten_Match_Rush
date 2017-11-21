local main
local inDebug = false

local function debugLoad(isDebug)
    inDebug = isDebug
end

local function debugUpdate(dt)

end

local function debugDraw()
end

local function keypressed(key)
    if inDebug == true then
        --Testing Display
        if key == "1" then
            dialogManager.getDDialog(1)
        elseif key == "2" then
            dialogManager.getDDialog(2)
        end

        if key == "3" then
            if gManager.getState() == BOARD_STATE then
                battleManager.startBattle(monsterManager.get(3))
            end
        end

        if key == "4" then
            player.move(1)
        end
    end

end

return{
    load = debugLoad,
    update = debugUpdate,
    draw = debugDraw,
    keypress = keypressed
}