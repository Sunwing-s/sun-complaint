local QBCore = exports['qb-core']:GetCoreObject()

--RegisterCommand("testcomplain", function(source) -- If you feel like testing it
--    TriggerEvent("sun-complaint")
--end)
CreateThread(function()
    exports["qb-target"]:AddBoxZone("s-complaint", vector3(440.2653, -981.1365, 30.6896), 1.65, 2.4, {
        name = "s-complaint",
        heading = 350.0,
        debugPoly = false,
        minZ = 28.52,
        maxZ = 32.12,
    }, {
        options = {
            {
                type = "client",
                event = "sun-complaint",
                label = "Police Complaint",
            },
        },
    distance = 2.5
    })
end)
RegisterNetEvent("sun-complaint", function() -- Translate This Stuff
    local complaint = exports['qb-input']:ShowInput({
        header = "Police Complaint",
        submitText = "Submit",
        inputs = {
            {
                text = "Name",
                name = "name",
                type = "text",
                isRequired = true,
            },
            {
                text = "Datum",
                name = "date", 
                type = "text", 
                isRequired = true,
               
            },
            {
                text = "Phone Number",
                name = "number",
                type = "number",
                isRequired = false,
            },
            {
                text = "Complaint Type",
                name = "type", 
                type = "radio",
                options = {
                    { value = "Complaint", text = "Complaint" },
                    { value = "Searchofficer", text = "Search for an Officer" }, 
                    { value = "Other", text = "Other" } 
                },
                
            },
            {
                text = "Information", 
                name = "info",
                type = "text",
            }
        },
    })

    if complaint ~= nil then
        TriggerServerEvent("sun-giveitem", complaint.name, complaint.date, complaint.number, complaint.type, complaint.info)
        TriggerServerEvent("sun:server:ComplaintLog", complaint.name, complaint.date, complaint.type, complaint.info, complaint.name, complaint.number)
    end
end)