local strings_array = {
    type = "array",
    default = {},
    elements = { type = "string" },
}

return {
    name = "dd01-uri-to-json",
    fields = {
        { config = {
            type = "record",
            fields = {
                {
                    exclude_params_names = strings_array
                }
            },
        },
        }
    }
}