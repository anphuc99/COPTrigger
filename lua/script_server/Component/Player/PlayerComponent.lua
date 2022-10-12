local EntityComponent = require "modules.Component.EntityComponent"

---@class PlayerComponet : EntityComponent
local PlayerComponet = class("PlayerComponet", EntityComponent)

function PlayerComponet:Start()
    self.GameObject:addHp(-10)
end

return PlayerComponet