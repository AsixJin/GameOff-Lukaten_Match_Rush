local player
local pX = 96
local pY = 160

local boardPos = 1

local scale = 1;
local offsetX = 0
local offsetY = 15

local health = 50

local function load()
    local sprite = love.graphics.newImage("graphics/testman.png")
    player = {
        sprite = sprite,
        x      = pX,
        y      = pY
    }
end

local function update(dt, state)
    if(state == BOARD_STATE) then
        if boardPos == 1 then
            player.x = 64
        else
            player.x = 64 + (pX * (boardPos-1))
        end
        scale = 1
    elseif(state == BATTLE_STATE) then
        scale = 0
    end
end

local function draw()
    love.graphics.draw(
        player.sprite,
        math.floor(player.x),
        math.floor(player.y),
        0,
        scale,
        scale,
        offsetX,
        offsetY
    )
end

local function getX()
    return player.x
end

local function getY()
    return player.y
end

-- True to add
-- False to subtract
local function modifyHealth(operation, num)
    if operation then
        health = health + num
    else
        health = health - num
    end
end

local function setHealth(num)
    health = num
end

local function getHealth()
    return health
end

local function addBPos(pos)
    if boardPos < 29 then
        boardPos = boardPos + pos
    else
        boardPos = 1
    end
end

local function setBPos(pos)
    boardPos = pos
end

return{
    x = getX,
    y = getY,
    move = addBPos,
    set = setBPos,
    getHP = getHealth,
    setHP = setHealth,
    modHP = modifyHealth,
    load = load,
    update = update,
    draw = draw
}
