EditState = Class{__includes = BaseState}

require 'libs.tilemap2d.editor.MapEditor'

function EditState:init()
    self.MapEditor = MapEditor()
end

function EditState:update(dt)
    self.MapEditor:update(dt)
end

function EditState:render()
    self.MapEditor:render()
end

function EditState:exit() end

function EditState:mousereleased(x, y, button)
    self.MapEditor:mousereleased(x, y, button)
end