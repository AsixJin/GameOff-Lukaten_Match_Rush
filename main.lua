-- Imports
local sti = require "libs/sti" --Simple Tiled Implementation
local dialogManager = require "libs/dialogmanager" --Asix Dialog Manager

function love.load()
    -- Load map file
    map = sti("maps/debug.lua")
    -- Load dialog manager
    dialogManager.load()

end

function love.update(dt)
    -- Update Map
    map:update(dt)

    --Testing Display
    if love.keyboard.isDown("a") then
        dialogManager.getDDialog(1)
    elseif love.keyboard.isDown("s") then
        dialogManager.getDDialog(2)
    end
end

function love.draw()
    -- Draw Map
    map:draw()

    -- Draw whatever the Dialog Manager needs to draw
    dialogManager.draw()
end
