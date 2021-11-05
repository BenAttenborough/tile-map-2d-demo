Push = require 'libs.push'
Class = require 'libs.class'
require 'libs.tilemap2d.tilemap2d'

require 'StateMachine'
require 'states.BaseState'
require 'states.MenuState'
require 'states.PlayState'
require 'states.EditState'
require 'configs.global'
require 'objects.Button'

function love.update(dt)
    StateMachine:update(dt)
end

function love.load()
    -- Setup graphics
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('My game')    
    Push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    -- Setup fonts
    Fonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
    }
    
    -- Setup state machine
    StateMachine = StateMachine {
        ['menu'] = function() return MenuState() end,
        ['play'] = function() return PlayState() end,
        ['edit'] = function() return EditState() end,
    }
    StateMachine:change('menu', {})
end

function love.draw()
    Push:apply('start')
    StateMachine:render()
    Push:apply('end')
end

function love.mousereleased(x, y, button)
    local screenX, screenY = Push:toGame(x,y)
    StateMachine:mousereleased(screenX, screenY, button)
end
