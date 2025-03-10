-- Title: Owner-Protected Reset  
-- Description: Restrict resetting state to the contract owner.  

Handlers.add(  
    "admin-reset",  
    Handlers.utils.hasMatchingData("admin-reset"),  
    function(msg)  
        if msg.From == Owner then  
            State.RequestCounter = 0  
            ao.send({ Target = msg.From, Data = "Counter reset!" })  
        else  
            ao.send({ Target = msg.From, Data = "Error: Owner-only action" })  
        end  
    end  
)  