local sti = require "libs/sti"

function love.load()
    -- Load map file
    map = sti("maps/debug.lua")
    -- Load Message Box Image
    msgBox = love.graphics.newImage("graphics/msgBox.png")
end

function love.update(dt)
    -- Update world
    map:update(dt)
end

function love.draw()
    -- Draw world
    map:draw()
    -- Draw Message Box
    love.graphics.draw(msgBox, 0, 320)
end
