local sti = require "libs/sti"
local displayText = "This is the text to display."

function love.load()
    -- Load map file
    map = sti("maps/debug.lua")
    -- Load Message Box Image
    msgBox = love.graphics.newImage("graphics/msgBox.png")
    -- Load and set font
    font = love.graphics.newImageFont("graphics/font2.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`_*#=[]'{}", 0)
    font:setLineHeight(.6)
    love.graphics.setFont(font, 32)


end

function love.update(dt)
    -- Update Map
    map:update(dt)
end

function love.draw()
    -- Draw Map
    map:draw()
    -- Draw Message Box
    love.graphics.draw(msgBox, 0, 320)

    -- Write Current Text
    love.graphics.print(displayText, 20, 335)
end
