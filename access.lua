local cjson         = require "cjson"
local pl_tablex     = require "pl.tablex"

local pl_copy_table = pl_tablex.deepcopy
local get_uri_args  = kong.request.get_query
local set_uri_args  = kong.service.request.set_query

local _M            = {}

-- value是否存在于table中
local function is_exist(tab, value)
    local revtab = {}
    for _, v in pairs(tab) do
        revtab[v] = true
    end
    return revtab[value]
end

function _M.execute(conf)

    -- 获取所有url参数
    local query_params = get_uri_args()
    local querystring  = pl_copy_table(query_params)
    local json_table   = {};

    for k, v in pairs(query_params) do
        if conf.exclude_params_names then
            if not is_exist(conf.exclude_params_names, k) then
                json_table[k]  = v
                querystring[k] = nil
            end
        end

        querystring['params'] = cjson.encode(json_table)

    end

    set_uri_args(querystring)

end

return _M