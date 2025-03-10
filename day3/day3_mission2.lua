-- Title: State Persistence  
-- Description: Safeguard state during code updates.  

-- Initialize state safely  
if not State.RequestCounter then  
    State.RequestCounter = 0  -- Only set if not already defined  
end  

-- Handler that preserves state:  
Handlers.add(  
    "request-tracker",  
    Handlers.utils.hasMatchingData("track"),  
    function(msg)  
        State.RequestCounter = State.RequestCounter + 1  -- Fixed increment syntax  
        ao.send({  
            Target = msg.From,  
            Data = "Tracked request #" .. State.RequestCounter  
        })  
    end  
)  