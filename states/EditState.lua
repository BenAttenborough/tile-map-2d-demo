EditState = Class{__includes = BaseState}

function EditState:init()
    self.prevMouseDown = false
end

function EditState:update(dt)
    
end

function EditState:render()

end

function EditState:exit() end

function EditState:mousereleased(x, y, button)
    MapEditor:mousereleased(x, y, button)
end