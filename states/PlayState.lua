PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.prevMouseDown = false
end

function PlayState:update(dt)
    if love.mouse.isDown(1) and not self.prevMouseDown then
        local x,y = push:toGame(love.mouse.getX(), love.mouse.getY())
        Tilemap2d:detectClick(x, y, 1)
        MapEditor:click(x, y, 1)
    end
    self.prevMouseDown = love.mouse.isDown(1)
end

function PlayState:render()
    Tilemap2d:draw()
    MapEditor:render()
    Tilemap2d:debug()
end

function PlayState:exit() end

function PlayState:mousereleased(x, y, button)
    MapEditor:mousereleased(x, y, button)
end