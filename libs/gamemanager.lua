-- Constants
TITLE_STATE = 2
BOARD_STATE = 0
BATTLE_STATE = 1

local gameState = BOARD_STATE

local function getState()
    return gameState
end

local function changeState(state)
    gameState = state
end

return{
    getState = getState,
    changeState = changeState
}

