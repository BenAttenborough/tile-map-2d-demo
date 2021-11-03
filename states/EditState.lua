EditState = Class{__includes = BaseState}

require 'libs.tilemap2d.tilemap2d'

function EditState:init()
    print("EditState Init")
    self.prevMouseDown = false
    self.mapLoaded = false
    self.loadButton = ButtonA(20,200,100,14,'Load','load',self)
    self.saveButton = Button(20,225,100,14,'Save',self.save)
end

function EditState:update(dt)
    if love.mouse.isDown(1) and not self.prevMouseDown then
        local x,y = Push:toGame(love.mouse.getX(), love.mouse.getY())
        self.loadButton:mouseClick(x, y, 1)
        self.saveButton:mouseClick(x, y, 1)
    end
    self.prevMouseDown = love.mouse.isDown(1)
end

function EditState:render()
    self.loadButton:draw()
    self.saveButton:draw()
    if self.mapLoaded then
        Tilemap2d:draw()
    end
end

function EditState:exit() end

function EditState:load()
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
    self.mapLoaded = true
end

function EditState:save()
    print("Would be saving")
end

function EditState:mousereleased(x, y, button)
    self.loadButton:mousereleased(x, y, button)
    self.saveButton:mousereleased(x, y, button)
end