return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function ()
        local ibl = require('ibl')
        local exclude_ft = { "help", "git", "markdown", "snippets", "text", "gitconfig", "dashboard" }

        ibl.setup {
            indent = {
                char = "▏",
            },
            scope = {
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = exclude_ft,
                buftypes = { "terminal" },
            },
        }
    end
}
