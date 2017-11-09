local sti = require "libs/sti"

function love.load()
    -- Load map file
    map = sti("maps/debug.lua")
    -- Load Message Box Image
    msgBox = love.graphics.newImage("graphics/msgBox.png")
    -- Load font
    font = love.graphics.newImageFont("graphics/font2.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`_*#=[]'{}", 0)
    font:setLineHeight(.6)
    love.graphics.setFont(font, 32)
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
    -- Write some text
    love.graphics.print("I am Asix Jin!", 20, 335)
end
