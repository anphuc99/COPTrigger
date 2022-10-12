
            Event:RegisterCustomEvent("ENTITY_AASW")
            Event:GetEvent("ENTITY_AASW"):Bind(function (abc,xyz)
                
            local money,result
            
            local _____component = Lib.getComponent("player")
            _____component:getMoney(money)
            
            Lib.compare2Numbers(money,2,result)
            
            if result then
                
            if money then
                
            local _____component = Lib.getComponent("player")
            _____component:tada(1,2,3)
            
        
            
            else
                
            local _____component = Lib.getComponent("player")
            _____component:addMoney(200)
            
                    
        
            end
        
            
            else
                
            local _____component = Lib.getComponent("player")
            _____component:kill()
            --fill
                    
        
            end
        
        
        
        
            end)

            --next
        