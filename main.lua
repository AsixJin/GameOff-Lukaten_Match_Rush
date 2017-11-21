-- Imports
Camera = require "libs/Camera" -- STALKER-X Camera Library
gCam = require "libs/cameramanager" -- Asix Camera Manager (Uses STALKER-X)
battleManager = require "libs/battlemanager" --Asix Battle Manager
boardManager = require "libs/boardmanager" -- Asix Board Manager
monsterManager = require "libs/monstermanager" -- Asix Monster Manager
dialogManager = require "libs/dialogmanager" --Asix Dialog Manager
player = require "libs/player" -- Player Script
gManager = require "libs/gamemanager" -- Game Manager
dManager = require "libs/debugmanager" -- Debug Manager


local backdropSprite

function love.load()
    boardManager.load()
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
    -- If on board, use board manager update
    if gManager.getState() == BOARD_STATE then
        boardManager.update(dt)
    -- If in battle, use battle manager update
    elseif gManager.getState() == BATTLE_STATE then
        battleManager.update(dt)
    end
end

function love.draw()
    -- Debug Draw
    dManager.draw()
    -- Draw the dialogue box & relevant text
    dialogManager.draw()
    -- Draw Battle Background
    love.graphics.draw(backdropSprite, 0, 0)
    -- If in battle state draw battle manager
    if gManager.getState() == BATTLE_STATE then
        battleManager.draw()
    end
    -- Before Draw for the Game Camera
    gCam.bDraw()
    -- If on Board State
    if gManager.getState() == BOARD_STATE then
        boardManager.draw()
    end
    -- Draw player
    player.draw()
    -- After Draw for the Game Camera
    gCam.aDraw()
end

function love.keypressed(key)
    dManager.keypress(key)

    if gManager.getState() == BOARD_STATE then
        boardManager.keypress(key)
    elseif gManager.getState() == BATTLE_STATE then
        battleManager.keypress(key)
    end

end
