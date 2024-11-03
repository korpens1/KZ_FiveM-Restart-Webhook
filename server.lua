local webhook = "" -- Your WebHook Link
local server_name = "" -- Your Server Name
local server_ip = "" -- Your Server IP
local logo = "" -- Your Server Logo

AddEventHandler('onResourceStart', function(FX_resource)
    if (GetCurrentResourceName() ~= FX_resource) then
        return
    end
    if webhook == "" then
        print("[^1Error^7] The `^3webhook^7` argument has not been set.")
    end
    if server_name == "" then
        print("[^1Error^7] The `^3server_name^7` argument has not been set.")
    end
    if server_ip == "" then
        print("[^1Error^7] The `^3server_ip^7` argument has not been set.")
    end
    if logo == "" then
        print("[^1Error^7] The `^3logo^7` argument has not been set.")
    end
        local embed = {
            {
                ["title"]= "The server has been restarted!",
                ['description'] = ("Press **F8** and type: \n```connect ".. server_ip .."```"),
                ["color"] = 11342935, -- Color, List: https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812
                ["thumbnail"] = {
                    ["url"] = logo,
                },
            }
        }
        PerformHttpRequest(webhook, function(err, headers) end, 'POST', json.encode({username = server_name, avatar_url = logo, embeds = embed}), { ['Content-Type'] = 'application/json' })      
    end)