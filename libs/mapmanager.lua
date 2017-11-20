local map
local world
local layer

local function load(loadedMap)
    map = loadedMap

    -- Create new dynamic data layer called "Sprites" as the 2nd layer
    layer = map:addCustomLayer("Sprites", 2)

    -- Remove unneeded object layer
    map:removeLayer("Object Layer 1")
end

local function update(dt)
    -- Update Map
    map:update(dt)
end

local function draw()
    -- Draw Map
    map:draw()
end

return{
    map = map,
    load = load,
    update = update,
    draw = draw
}

