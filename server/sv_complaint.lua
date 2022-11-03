local QBCore = exports['qb-core']:GetCoreObject()

-- Webhook Stuff
local Webhook = "https://ptb.discord.com/api/webhooks/1037692162080514050/27mDjpWEihR8ZHK1NryWo9rNPBz2w74o6jujrFfNsuDs1OM3BYLclTR5f-68ne_CRCM_",

RegisterNetEvent("sun-giveitem", function(name, date, number, typer, infor)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {
        name = name,
        date = date,
        number = number,
        typer = typer,
        infor = infor
    }
    Player.Functions.AddItem('complaint', 1, false, info)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['complaint'], "add")
end)

RegisterNetEvent('sun:server:ComplaintLog', function(name, date, typer, info, namer, number) -- If you know what you are doing you can change the shit below, it changes the message
    local title = "Police Complaint (Name: "..namer..")"
    local message = "Datum: "..date.." Type: "..typer.." Number: "..number.." Message: "..info.." "
    local webHook = Webhook -- config
    local embedData = {
        {
            ['title'] = title,
            ['color'] = 16711680,
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Police Complaint',
                ['icon_url'] = '',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'Police Complaints', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
end)