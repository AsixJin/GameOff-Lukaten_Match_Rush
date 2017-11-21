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
        if health >= 50 then
            health = 50
        end
    else
        health = health - num
        if health <= 0 then
            health = 0
        end
    end
end

local function setHealth(num)
    if num >= 0 or num <= 50 then
        health = num
    end
end

local function getHealth()
    return health
end

local function addBPos(pos)
    local tPos = boardPos + pos
    local didMove = true
    if tPos <= 29 then
        boardPos = tPos
    else
        didMove = false
    end
    return didMove
end

local function removePos(pos)
    local tPos = boardPos - pos
    local didMove = true
    if tPos >= 0 then
        boardPos = tPos
    else
        didMove = false
    end
    return didMove
end

local function setBPos(pos)
    boardPos = pos
end

local function getBoardPosition()
    return boardPos
end

return{
    x = getX,
    y = getY,
    move = addBPos,
    back = removePos,
    set = setBPos,
    getHP = getHealth,
    setHP = setHealth,
    modHP = modifyHealth,
    getBP = getBoardPosition,
    load = load,
    update = update,
    draw = draw
}
