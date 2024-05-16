local webhook = ""

RegisterNetEvent('mrw_crafting:giveitems')
AddEventHandler('mrw_crafting:giveitems', function(craftingType, craftingOption)
    local src = source
    local hasRequiredItems = true  -- Reset flag for each crafting option
    local addedItems = {} -- Initialize the addedItems table for each event trigger
    local text = craftingOption.progressbar
    local time = craftingOption.duration

    -- Check if player has required items for the current crafting option
    for _, requiredItem in ipairs(craftingOption.requireditems) do
        local needitem = requiredItem.name
        local needitemcount = requiredItem.amount

        local inventoryItem = GetItem(needitem, needitemcount, src)
        if not inventoryItem then
            hasRequiredItems = false
            break  -- No need to check further, we've already found an issue
        end
    end

    -- Process crafting based on flag for the current crafting option
    if hasRequiredItems then
        lib.callback.await('mrw_crafting:serverprogress', src, text, time)
        -- Process crafting if all required items are present for the current option
        for _, requiredItem in ipairs(craftingOption.requireditems) do
            local needitem = requiredItem.name
            local needitemcount = requiredItem.amount

            if Config.EnableDebug then 
                print(needitem)
                print(needitemcount)
            end

            RemoveItem(needitem, needitemcount, src)
        end

        for _, itemname in ipairs(craftingOption.additems) do
            local additem = itemname.name 
            local additemcount = itemname.amount

            if Config.EnableDebug then 
                print(additem)
                print(additemcount)
            end

            DiscordLog(webhook, "Crafting", GetPlayerName(source) .. " have crafted " .. additemcount .. "x " .. additem .. " at " .. craftingType)
            if not addedItems[additem] then

                AddItem(additem, additemcount, src)
                addedItems[additem] = true
            end
        end
    else 
        lib.notify(src,{
            title = "Crafting",
            description = "Nemáš u sebe potřebné věci!",
            type = 'error'
        })
    end

end)

function DiscordLog(webhook,name,message,color)
    local embeds = {
        {
            ["title"] = name,
            ["description"] = message,
            ["type"] = "rich",
            ["color"] = 56108,
            ["footer"] = {
                ["text"] = "mrw_crafting " .. os.date('%H:%M - %d. %m. %Y', os.time()),
            },
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = embeds }), { ['Content-Type'] = 'application/json' })
end