return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        local keymap = vim.keymap
        local nvim_tree = require("nvim-tree")

        nvim_tree.setup {
            renderer = {
                indent_markers = {
                    enable = true,
                },
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
            trash = {
                cmd = "trash",
                require_confirm = true,
            },
        }

        keymap.set("n", "<leader>bb", require("nvim-tree.api").tree.toggle, {
            silent = true,
            desc = "toggle nvim-tree",
        })
    end
}
