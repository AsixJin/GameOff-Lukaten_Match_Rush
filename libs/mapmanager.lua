local map
local world

local function load(loadedMap)
    map = loadedMap

    --Setup Physics
    love.physics.setMeter(32)
    world = love.physics.newWorld(0, 0)
    map:box2d_init(world)

    -- Create new dynamic data layer called "Sprites" as the 8th layer
    local layer = map:addCustomLayer("Sprites", 2)

    -- Get player spawn object
    local player
    for k, object in pairs(map.objects) do
        if object.name == "player" then
            player = object
            break
        end
    end

    -- Create player object
    local sprite = love.graphics.newImage("graphics/testman.png")
    layer.player = {
        sprite = sprite,
        x      = player.x,
        y      = player.y,
        ox     = sprite:getWidth() / 2,
        oy     = sprite:getHeight() / 1.35,
        pBody  = love.physics.newBody(world, player.x, player.y, "dynamic")
    }

    -- Add controls to player
    layer.update = function(self, dt)
        -- 96 pixels per second
        local speed = 96

        -- Move player up
        if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
            self.player.y = self.player.y - speed * dt
            self.player.pBody.y = self.player.pBody.y - speed * dt
        end

        -- Move player down
        if love.keyboard.isDown("s") or love.keyboard.isDown("down") then
            self.player.y = self.player.y + speed * dt
            self.player.pBody.y = self.player.pBody.y + speed * dt
        end

        -- Move player left
        if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
            self.player.x = self.player.x - speed * dt
            self.player.pBody.x = self.player.pBody.x - speed * dt
        end

        -- Move player right
        if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
            self.player.x = self.player.x + speed * dt
            self.player.pBody.x = self.player.pBody.x + speed * dt
        end
    end

    -- Draw player
    layer.draw = function(self)
        love.graphics.draw(
            self.player.sprite,
            math.floor(self.player.x),
            math.floor(self.player.y),
            0,
            1,
            1,
            self.player.ox,
            self.player.oy
        )

        -- Temporarily draw a point at our location so we know
        -- that our sprite is offset properly
        love.graphics.setPointSize(5)
        love.graphics.points(math.floor(self.player.x), math.floor(self.player.y))
    end

    -- Remove unneeded object layer
    map:removeLayer("Object Layer 1")
end

local function update(dt)
    -- Update Map
    map:update(dt)
    -- Update World
    world:update(dt)
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

