return {
    "catppuccin/nvim",
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavour = "mocha",
            transparent_background = true,
            default_integrations = false,
            integrations = {
                telescope = true,
                mason = true,
                notify = true,
                render_markdown = true,
                cmp = true,
                dap = true,
                dap_ui = true,
                nvim_surround = true,
                nvimtree = true,
                treesitter = true,
                treesitter_context = true,
                ufo = true,
                overseer = true,
                gitsigns = true,
            },
            term_colors = true,
        })
    end
}
