-- Title: Cross-Contract Messaging  
-- Description: Send messages between two AO processes.  

-- Start a second AOS process in a new terminal. Note its ID.  
local receiverId = "<SECOND_PROCESS_ID>"  

-- Send a "signal" message to the second process:  
Send({ Target = receiverId, Data = "signal" })  

-- If the second process has this handler:  
Handlers.add(  
    "signal-handler",  
    Handlers.utils.hasMatchingData("signal"),  
    Handlers.utils.reply("acknowledge")  
)  
-- Check the second process's inbox for "signal" and its response "acknowledge".  