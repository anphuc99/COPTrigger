---@class Component
local Component = class("Component")

function Component:init()
    self:Start()   
end

function Component:Start()
end

function Component:Update()
end

function Component:Destroy()    
    self.Updated()
end

function Component:StartUpdate()
    self.Updated = Lib.subscribeEvent("StartUpdate",Lib.handler(self, self.Update))
end

function Component:StopUpdate()
    self.Updated()
end

return Component