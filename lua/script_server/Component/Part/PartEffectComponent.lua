local InstanceComponent = require "modules.Component.InstanceComponent"

---@class PartEffectComponet : InstanceComponent
local PartEffectComponet = class("PartEffectComponet", InstanceComponent)

function PartEffectComponet:Start()
    self.Events = {
        PartTuoch = "onTouch"
    }
end

function PartEffectComponet:onTouch()    
    local part = self.GameObject
    local effect = part:FindFirstChild("EffectPart")
    effect.effectFilePath = self.effect
end

return PartEffectComponet