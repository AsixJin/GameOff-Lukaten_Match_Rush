local msgBox --The graphics of the message box
local displayText = "This is a dialog box" --Whatever the message should be showing in the box

--region Text Tables
--region Debug Dialog
local debugDialogTable = {
    "This is text from the dialog manager",
    "I am Asix Jin and this is my dialog\nmanager",
    "This is to test controls in battle\nmanager"
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

local function setDisplayText(text)
    displayText = text
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

end

local function draw()
    -- Draw Message Box
    love.graphics.draw(msgBox, 0, 320)
    -- Write Current Text
    love.graphics.print(displayText, 20, 335)
    -- Write Player's Health
    love.graphics.print("Roku's HP: "..player.getHP().."   Space "..player.getBP() .." / 29", 20, 390)

end
--endregion

return {
    --Function Short Hands
    getDDialog = getDebugDialog;
    getADialog = getAreaDialog;
    getNDialog = getNPCDialog;
    setText = setDisplayText,
    --Lifecycles
    load = load;
    update = update;
    draw = draw;
}
