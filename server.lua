local function LogsDiscordScript(nom, titre, desc, color, webhook)
    if not webhook then return end

    local date = os.date("*t")
    local formattedDate = string.format("%02d/%02d/%04d à %02dh%02dm%02ds", date.day, date.month, date.year, date.hour, date.min, date.sec)

    nom = nom or "Bot Logs"
    titre = titre or "Titre"
    desc = desc or "..."
    color = color or 0

    local embed = {
        {
            ["color"] = color,
            ["title"] = titre,
            ["description"] = desc,
            ["footer"] = {
                ["text"] = formattedDate,
                ["icon_url"] = nil
            }
        }
    }

    PerformHttpRequest(webhook, function() end, 'POST', json.encode({ username = nom, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

exports('LOGS_DISCORD', LogsDiscordScript)
