MenuState = Class{__includes = BaseState}

require 'objects.Button'

function MenuState:init()
    -- self.saveButton = Button(20,200,100,14,'Save',self.saveHandler)
    -- self.loadButton = Button(20,225,100,14,'Load',self.loadHandler)
end

function MenuState:update(dt)
    
end

function MenuState:render()

end

function MenuState:exit() end

function MenuState:mousereleased(x, y, button)
    MapEditor:mousereleased(x, y, button)
end