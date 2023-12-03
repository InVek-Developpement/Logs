local date = os.date("*t")

if date.day < 10 then date.day = '0' .. tostring(date.day) end
if date.month < 10 then date.month = '0' .. tostring(date.month) end
if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
if date.min < 10 then date.min = '0' .. tostring(date.min) end
if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end

local function LogsDiscordScript(nom, titre, desc, webhook)
    local embed = {
        {
            ["color"] = 0,
            ["title"] = titre,
            ["description"] = desc,
            ["footer"] = {
                ["text"] = ("%s/%s/%s à %sh%sm %ss"):format(date.day, date.month, date.year, date.hour, date.min, date.sec),
                ["icon_url"] = nil
            }
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = nom, embeds = embed}), { ['Content-Type'] = 'application/json' })
end