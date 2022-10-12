local WorldComponent = require "modules.Component.WorldComponent"
local PlayerComponet = require "script_server.Component.Player.PlayerComponent"
local PartComponent = require("script_server.Component.Part.PartConponent")
local PartEffectComponet = require("script_server.Component.Part.PartEffectComponent")

---@class WorldManager : WorldComponent
local WorldManager = class("WorldManager", WorldComponent)

function WorldManager:Start()
    World.Timer(1, Lib.handler(self, self.Tick))
    self.Events = {
        ["OnPlayerLogin"] = "onEntityEnter",
        ["GAME_START"] = "onGameStart"
    }
end

function WorldManager:Tick()
    Lib.emitEvent("StartUpdate")
    return true
end  

function  WorldManager:onEntityEnter(context)
    ---@type Entity
    local entity = context.obj1
    if entity.isPlayer then
        Lib.addComponent(entity, "PlayerComponet", PlayerComponet)
    end
end

function WorldManager:onGameStart()
    local part = Instance.GetInstanceByID(8837559917931577345)
    Lib.addComponent(part, "PartComponent",PartComponent)
    Lib.addComponent(part, "PartEffectComponet",PartEffectComponet, {effect = "asset/effect/Yellow Light Pillar Crash Effect/gfxy207_falling beam of light_yellow_3d.effect"})
end

return WorldManager