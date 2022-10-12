local TrigerCheck = Trigger.CheckTriggers

function Trigger.CheckTriggers(cfg, name, context)
    pcall(function ()
        Event:GetEvent(name):Emit(context, cfg)
    end)
    TrigerCheck(cfg,name, context)
end