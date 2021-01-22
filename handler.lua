local BasePlugin         = require "kong.plugins.base_plugin"
local QueryStringToJsonHandler   = BasePlugin:extend()
local access             = require "kong.plugins.query-string-to-json.access"

QueryStringToJsonHandler.VERSION = "0.1.0"

function QueryStringToJsonHandler:new()
    QueryStringToJsonHandler.super.new(self, "kong-query-string-to-json")
end

function QueryStringToJsonHandler:access(conf)
    QueryStringToJsonHandler.super.access(self)
    access.execute(conf)
end

function QueryStringToJsonHandler:header_filter(conf)

end

return QueryStringToJsonHandler
