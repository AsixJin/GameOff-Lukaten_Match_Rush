-- Imports
Camera = require "libs/Camera" -- STALKER-X Camera Library
gCam = require "libs/cameramanager" -- Asix Camera Manager (Uses STALKER-X)
dialogManager = require "libs/dialogmanager" --Asix Dialog Manager
player = require "libs/player" -- Player Script
gManager = require "libs/gamemanager" -- Game Manager
dManager = require "libs/debugmanager" -- Debug Manager



local boardSprite
local backdropSprite

function love.load()
    -- Init Game Board
    boardSprite = love.graphics.newImage("maps/debug.png")
    -- Init the Battle Backdrop
    backdropSprite = love.graphics.newImage("graphics/backdrop.png")
    -- Init Camera
    gCam.load(Camera(160.5, 160.5, 320, 320))
    -- Load the player
    player.load()
    -- Load the Dialogue Manager
    dialogManager.load()
    -- Init Debug Manager
    dManager.load(true)
end

function love.update(dt)
    -- Debug Update
    dManager.update(dt)
    -- Update the dialog manager
    dialogManager.update(dt)
    -- Update Player
    player.update(dt, gManager.getState())
    -- Update Camera
    gCam.update(dt, player.x(), player.y())
end

function love.draw()
    -- Debug Draw
    dManager.draw()
    -- Draw the dialogue box & relevant text
    dialogManager.draw()
    -- Draw Game Board
    love.graphics.draw(backdropSprite, 0, 0)
    -- Before Draw for the Game Camera
    gCam.bDraw()
    -- If on Board State
    if(gManager.getState() == BOARD_STATE) then
        -- Draw Game Board
        love.graphics.draw(boardSprite, 0, 0)
    end
    -- Draw player
    player.draw()
    -- After Draw for the Game Camera
    gCam.aDraw()
end
