push = require 'libs.push'
Class = require 'libs.class'
require 'libs.tilemap2d.tilemap2d'
require 'libs.tilemap2d.MapEditor'

require 'StateMachine'
require 'states.BaseState'
require 'states.MenuState'
require 'states.PlayState'
require 'states.EditState'
require 'configs.global'

require 'objects.Button'

function love.update(dt)
    gStateMachine:update(dt)
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    gFonts = {
        ['small'] = love.graphics.newFont('fonts/font.ttf', 8),
        ['medium'] = love.graphics.newFont('fonts/font.ttf', 16),
        ['large'] = love.graphics.newFont('fonts/font.ttf', 32)
    }
    local tileConfig = {}
    tileConfig['map'] = map
    tileConfig['spriteSheet'] = 'sprites/tilemap.png'
    tileConfig['spriteSize'] = {}
    tileConfig['spriteSize']['width'] = 10
    tileConfig['spriteSize']['height'] = 10
    tileConfig['spriteCount'] = 4
    tileConfig['offsetX'] = 20
    tileConfig['offsetY'] = 50
    Tilemap2d = TileMap2d(tileConfig)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('My game')    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    MapEditor = MapEditor(tileConfig)
    
    gStateMachine = StateMachine {
        ['menu'] = function() return MenuState() end,
        ['play'] = function() return PlayState() end,
        ['edit'] = function() return EditState() end,
    }
    gStateMachine:change('menu', {})
end

function love.draw()
    push:apply('start')
    gStateMachine:render()
    push:apply('end')
end

function love.mousereleased(x, y, button)
    local screenX, screenY = push:toGame(x,y)
    gStateMachine:mousereleased(screenX, screenY, button)
end
