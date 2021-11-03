MenuState = Class{__includes = BaseState}

require 'objects.Button'

function MenuState:init()
    self.playButton = Button(20,200,100,14,'Play',self.switchToPlayState)
    self.editButton = Button(20,225,100,14,'Edit',self.switchToEditState)
    self.prevMouseDown = false
end

function MenuState:update(dt)
    if love.mouse.isDown(1) and not self.prevMouseDown then
        local x,y = push:toGame(love.mouse.getX(), love.mouse.getY())
        self.playButton:mouseClick(x, y, 1)
        self.editButton:mouseClick(x, y, 1)
    end
    self.prevMouseDown = love.mouse.isDown(1)
end

function MenuState:render()
    self.playButton:draw()
    self.editButton:draw()
end

function MenuState:exit() end


function MenuState:switchToPlayState()
    gStateMachine:change('play', {})
end

function MenuState:switchToEditState()
    gStateMachine:change('edit', {})
end

function MenuState:mousereleased(x, y, button)
    self.playButton:mousereleased(x, y, button)
    self.editButton:mousereleased(x, y, button)
end