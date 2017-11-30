local boardMusic
local battleMusic
local bossMusic
local victoryMusic

local currentMusic

local function load()
    boardMusic = ripple.newSound("music/board.mp3")
    battleMusic = ripple.newSound("music/regularBattle.mp3")
    bossMusic = ripple.newSound("music/finalBoss.mp3")
    victoryMusic = ripple.newSound("music/Victory.mp3")

    currentMusic = boardMusic;
    currentMusic:play()
end

local function update(dt)
    currentMusic:update(dt)
end

local function playBoardMusic()
    currentMusic:stop()
    currentMusic = boardMusic
    currentMusic:play()
end

local function playBattleMusic()
    currentMusic:stop()
    currentMusic = battleMusic
    currentMusic:play()
end

local function playBossMusic()
    currentMusic:stop()
    currentMusic = bossMusic
    currentMusic:play()
end

local function playVictoryMusic()
    currentMusic:stop()
    currentMusic = victoryMusic
    currentMusic:play()
end

return{
    load = load,
    update = update,
    playBoard = playBoardMusic,
    playBattle = playBattleMusic,
    playBoss = playBossMusic,
    playVictory = playVictoryMusic
}