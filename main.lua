-- Imports
local sti = require "libs/sti" --Simple Tiled Implementation
local dialogManager = require "libs/dialogmanager" --Asix Dialog Manager
local mapManager = require "libs/mapmanager" --Asix Map Manager

function love.load()
    -- Get a Tiled map and load it into
    -- the Map Manager.
    map = sti("maps/debug.lua", { "box2d" })
    mapManager.load(map)

    -- Load Dialog Manager
    dialogManager.load()
end

function love.update(dt)
   mapManager.update(dt)

    --Testing Display
    if love.keyboard.isDown("a") then
        dialogManager.getDDialog(1)
    elseif love.keyboard.isDown("s") then
        dialogManager.getDDialog(2)
    end
end

function love.draw()
    mapManager.draw()

    -- Draw the dialogue box & relevant text
    dialogManager.draw()
end
