local camera

local function load(gamecamera)
    camera = gamecamera
    camera:setFollowStyle('SCREEN_BY_SCREEN')
end

local function update(dt, playerX, playerY)
    -- Update Camera
    camera:update(dt)
    -- Camera should follow the player
    camera:follow(playerX, playerY)
end

local function bDraw()
    -- Attach Camera
    camera:attach()
end

local function aDraw()
    -- Detach and Draw Camera
    camera:detach()
    camera:draw()
end

return{
    load = load,
    update = update,
    bDraw = bDraw,
    aDraw = aDraw
}