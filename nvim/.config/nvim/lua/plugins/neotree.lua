return {
    "nvim-neo-tree/neo-tree.nvim",
    event = "VeryLazy",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function ()
        require("neo-tree").setup({
            enable_diagnostics = false,
            popup_border_style = "single",
            open_files_do_not_replace_types = { "terminal", "Outline", "qf" },
            default_component_configs = {
                symlink_target = {
                    enabled = true,
                },
                git_status = {
                    symbols = {
                        unstaged  = "",
                        staged    = "",
                    },
                    align = "right",
                },
                modified = {
                    symbol = "~",
                },
                -- diagnostics = {
                --     symbols = {
                --         error = "󰅙 ",
                --         warn = "󰀦 ",
                --         info = "󰋼 ",
                --         hint = "󰋗 ",
                --     },
                -- },
            },
            window = {
                mappings = {
                    ["<TAB>"] = { "toggle_node" },
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
        })

        vim.api.nvim_create_autocmd({ "BufLeave" }, {
            pattern = { "*Neogit*" },
            group = vim.api.nvim_create_augroup("git_refresh_neotree", {clear = true}),
            callback = function()
                local events = require("neo-tree.events")
                events.fire_event(events.GIT_EVENT)
            end,
        })
    end,
    keys = {
        { "<leader>bb", "<CMD>Neotree<CR>", mode = { "n" } }
    }
}
