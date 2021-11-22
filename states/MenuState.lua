MenuState = Class{__includes = BaseState}

local Button = require 'objects.Button'

function MenuState:init()
    self.playButton = Button(20,200,100,14,'Play','switchToPlayState',self)
    self.editButton = Button(20,225,100,14,'Edit','switchToEditState',self)
    self.prevMouseDown = false
end

function MenuState:update(dt)
    if love.mouse.isDown(1) and not self.prevMouseDown then
        local x,y = Push:toGame(love.mouse.getX(), love.mouse.getY())
        self.playButton:mouseClick(x, y, 1)
        self.editButton:mouseClick(x, y, 1)
    end
    self.prevMouseDown = love.mouse.isDown(1)
end

function MenuState:render()
    self.playButton:draw()
    self.editButton:draw()
    love.graphics.rectangle("line", 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
end

function MenuState:exit() end


function MenuState:switchToPlayState()
    StateMachine:change('play', {})
end

function MenuState:switchToEditState()
    StateMachine:change('edit', {})
end

function MenuState:mousereleased(x, y, button)
    self.playButton:mousereleased(x, y, button)
    self.editButton:mousereleased(x, y, button)
end

return MenuState