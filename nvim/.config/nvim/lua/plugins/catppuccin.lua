return {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavour = "mocha",
            -- transparent_background = true,
            default_integrations = false,
            integrations = {
                telescope = false,
                mason = true,
                cmp = true,
                dap = true,
                dap_ui = true,
                nvim_surround = true,
                treesitter = true,
                treesitter_context = true,
                ufo = true,
                overseer = true,
                gitsigns = true,
                indent_blankline = false,
                noice = true,
                snacks = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                        ok = { "undercurl" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            },
            term_colors = true,
        })
        vim.cmd([[colorscheme catppuccin]])
    end
}
