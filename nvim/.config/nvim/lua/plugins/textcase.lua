return {
    "johmsalas/text-case.nvim",
    config = function()
        local opts = {
            noremap = true,
            silent = true,
        }
        local textcase = require("textcase")
        textcase.setup({
            default_keymappings_enabled = false,
            prefix = "ga",
            substitude_command_name = nil,
            enabled_methods = {
                -- "to_upper_case",
                -- "to_lower_case",
                "to_snake_case",
                -- "to_dash_case",
                -- "to_title_dash_case",
                -- "to_constant_case",
                -- "to_dot_case",
                -- "to_comma_case",
                -- "to_phrase_case",
                "to_camel_case",
                "to_pascal_case",
                -- "to_title_case",
                -- "to_path_case",
                -- "to_upper_phrase_case",
                -- "to_lower_phrase_case",
            },
        })
        vim.keymap.set("n", "gas",function () textcase.lsp_rename('to_snake_case') end, opts)
        vim.keymap.set("n", "gac",function () textcase.lsp_rename('to_camel_case') end, opts)
        vim.keymap.set("n", "gap",function () textcase.lsp_rename('to_pascal_case') end, opts)
        vim.keymap.set("n", "gaws",function () textcase.current_word('to_snake_case') end, opts)
        vim.keymap.set("n", "gawc",function () textcase.current_word('to_camel_case') end, opts)
        vim.keymap.set("n", "gawp",function () textcase.current_word('to_pascal_case') end, opts)
    end,
    lazy = false,
}
