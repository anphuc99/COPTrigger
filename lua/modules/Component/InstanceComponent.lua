local Component = require "modules.Component"

---@class InstanceComponent : Component
local InstanceComponent = class("InstanceComponent", Component)

function InstanceComponent:init()
    self.Events = {}    
    self.FuncEvents = {}
    self:Start()
    self:addEvent()
    self.GameObject:GetEvent("OnDestroy"):Bind(Lib.handler(self, self.Destroy))
end

function InstanceComponent:addEvent()
    for key, value in pairs(self.Events) do
        local event = self.GameObject:GetEvent(key)
        if event then
            event:Bind(Lib.handler(self,self[value]))
        else
            Event:RegisterCustomEvent(key)
            local event = Event:GetEvent(key)
            event:Bind(function (context)
                if context.part1 == self.GameObject then
                    self[value](self,context)
                end
            end)
            table.insert(self.FuncEvents, event)
        end
    end
end

function InstanceComponent:Emit(event,context)    
    context = context or {}
    context.part1 = self.GameObject
    Event:GetEvent(event):Emit(context)
end

function InstanceComponent:Destroy()
    for key, value in pairs(self.FuncEvents) do
        value:Destroy()
    end
end

return InstanceComponent