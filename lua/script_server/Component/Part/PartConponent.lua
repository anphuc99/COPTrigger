local InstanceComponent = require "modules.Component.InstanceComponent"

---@class PartConponent : InstanceComponent
local PartConponent = class("PartConponent", InstanceComponent)

function PartConponent:Start()
    self.Events = {
        ["OnCollisionBegin"] = "onCollisionBegin"
    }
    self.GameObject.useGravity = true
end

function PartConponent:onCollisionBegin()
    self:Emit("PartTuoch")
    World.Timer(40,function ()
        self.GameObject:Destroy()        
    end)
end

return PartConponent
