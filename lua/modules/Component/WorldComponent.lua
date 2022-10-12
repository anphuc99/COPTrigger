local Component = require "modules.Component"

---@class WorldComponent : Component
local WorldComponent = class("WorldComponent", Component)

function WorldComponent:init()
    self.Events = {}
    self.FuncEvents = {}
    self:Start()
    self:addEvent()
end

function WorldComponent:addEvent()
    for key, value in pairs(self.Events) do
        Event:RegisterCustomEvent(key)
        local event = Event:GetEvent(key)
        event:Bind(Lib.handler(self, self[value]))
        table.insert(self.FuncEvents, event)
    end
end

function WorldComponent:Destroy()
    for index, value in ipairs(self.FuncEvents) do
        value:Destroy()
    end
    self.super.Destroy(self)
end

function WorldComponent:Emit(event,...)
    Event:RegisterCustomEvent(event)
    local event = Event:GetEvent(event)
    event:Emit(...)
end

return WorldComponent