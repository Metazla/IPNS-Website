local http = require "resty.http"

local host = ngx.var.host
local subdomain = string.match(host, "^(%w+)%..*$")
if subdomain then

    local httpc = http.new()
    local res, err = httpc:request_uri("http://127.0.0.1:3000/get_ip/" .. subdomain, {
        method = "GET",
        headers = {
            ["Content-Type"] = "application/json",
        }
    })

    if not res then
        -- ngx.say("Failed to request: ", err)
        ngx.exit(542)
    end

    if res.status == ngx.HTTP_OK then
        ngx.var.backend_ip = res.body
    else
        -- ngx.say("Failed to get a valid response from API")
        ngx.exit(543)
    end
else
    ngx.exit(ngx.HTTP_BAD_REQUEST)
end
