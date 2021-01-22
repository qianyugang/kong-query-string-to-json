local strings_array = {
    type = "array",
    default = {},
    elements = { type = "string" },
}

return {
    name = "kong-query-string-to-json",
    fields = {
        { config = {
            type = "record",
            fields = {
                {
                    exclude_params_names = strings_array,
                    params_name = {
                        type = "string",
                        required = false,
                        default = "params",
                    },
                }
            },
        },
        }
    }
}