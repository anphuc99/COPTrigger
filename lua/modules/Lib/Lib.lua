function Lib.handler(obj, method)
    return function(...)
        return method(obj, ...)
    end
end

function Lib.Func(f,...)
    local t = {...}
    return function()
        return f(table.unpack(t))
    end
end

function Lib.addComponent(object, name ,component, data)
    print(component)
    local cpn = component.new()
    cpn.GameObject = object
    cpn.__nameComponent = name
    if data then
        for key, value in pairs(data) do
           cpn[key] = value 
        end        
    end
    cpn:init()
    if not object.components then
        object.components = {}
    end

    object.components[name] = cpn
end

function Lib.removeComponent(object, name)
    if object.components then
        local cpn = object.components[name]
        cpn:Destroy()
        object.components[name] = nil
    end
end