-- Imports
local sti = require "libs/sti" --Simple Tiled Implementation
local dialogManager = require "libs/dialogmanager" --Asix Dialog Manager
local mapManager = require "libs/mapmanager" --Asix Map Manager

function love.load()
    -- Get a Tiled map and load it into the Map Manager.
    mapManager.load(sti("maps/debug.lua", { "box2d" }))
    -- Load Dialog Manager
    dialogManager.load()
end

function love.update(dt)
    -- Update all map related stuff
    mapManager.update(dt)
    -- Update the dialog manager
    dialogManager.update(dt)
end

function love.draw()
    -- Draw all map related stuff
    mapManager.draw()
    -- Draw the dialogue box & relevant text
    dialogManager.draw()
end
