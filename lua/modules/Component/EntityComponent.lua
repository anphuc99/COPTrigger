local Component = require "modules.Component"

---@class EntityComponent : Component
---@field GameObject Entity
local EntityComponent = class("EntityComponent", Component)

function EntityComponent:init()
    self.Events = {}
    self.FuncEvents = {}
    self:Start()
end

function EntityComponent:addEvent()
    for key, value in pairs(self.Events) do
        local event = Trigger.addHandler(self.GameObject:cfg(), key, function (context)
            if context.obj1 and context.obj1.objID == self.GameObject.objID then
                self[value](self, context)
            end
        end)
        table.insert(self.FuncEvents, event)
    end
end

function EntityComponent:Destroy()
    for index, value in ipairs(self.FuncEvents) do
        value()
    end
    self.super.Destroy(self)
end

function EntityComponent:Emit(event, context)
    context = context or {}
    context.obj1 = self.GameObject
    Trigger.CheckTriggers(self.GameObject:cfg(), event, context)
end

return EntityComponent