local msgBox --The graphics of the message box
local displayText = "Debug Area 1-1" --Whatever the message should be showing in the box

--region Text Tables
--region Debug Dialog
local debugDialogTable = {
    "This is text from the dialog manager",
    "I am Asix Jin and this is my dialog\nmanager"
}
--endregion

--region Area Dialog
local areaDialogTable = {

}
--endregion

--region NPC Dialog
local npcDialogTable = {

}
--endregion
--endregion

--region Dialog Getters
local function getDebugDialog(index)
    displayText = debugDialogTable[index]
end

local function getAreaDialog(index)
    displayText = areaDialogTable[index]
end

local function getNPCDialog(index)
    displayText = npcDialogTable[index]
end
--endregion

--region Lifecycle Functions
local function load()
    -- Load Message Box Image
    msgBox = love.graphics.newImage("graphics/msgBox.png")

    -- Load and set font
    font = love.graphics.newImageFont("graphics/font2.png", " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,!?-+/():;%&`_*#=[]'{}", 0)
    font:setLineHeight(.6)
    love.graphics.setFont(font, 32)
end

local function update()
    --Testing Display
    if love.keyboard.isDown("1") then
        getDebugDialog(1)
    elseif love.keyboard.isDown("2") then
        getDebugDialog(2)
    end
end

local function draw()
    -- Draw Message Box
    love.graphics.draw(msgBox, 0, 320)

    -- Write Current Text
    love.graphics.print(displayText, 20, 335)
end
--endregion

return {
    --Function Short Hands
    getDDialog = getDebugDialog;
    getADialog = getAreaDialog;
    getNDialog = getNPCDialog;
    --Lifecycles
    load = load;
    update = update;
    draw = draw;
}
