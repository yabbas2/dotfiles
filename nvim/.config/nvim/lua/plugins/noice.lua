return {
    {
        "rcarriga/nvim-notify",
        config = function ()
            require('notify').setup({
                render = "compact",
                stages = "static",
                timeout = 3000,
            })
            vim.api.nvim_set_hl(0, "NotifyERRORBody", { link = "TelescopeNormal" })
            vim.api.nvim_set_hl(0, "NotifyWARNBody", { link = "TelescopeNormal" })
            vim.api.nvim_set_hl(0, "NotifyINFOBody", { link = "TelescopeNormal" })
            vim.api.nvim_set_hl(0, "NotifyDEBUGBody", { link = "TelescopeNormal" })
            vim.api.nvim_set_hl(0, "NotifyTRACEBody", { link = "TelescopeNormal" })
            vim.api.nvim_set_hl(0, "NotifyERRORBorder", { link = "TelescopeBorder" })
            vim.api.nvim_set_hl(0, "NotifyWARNBorder", { link = "TelescopeBorder" })
            vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { link = "TelescopeBorder" })
            vim.api.nvim_set_hl(0, "NotifyINFOBorder", { link = "TelescopeBorder" })
            vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { link = "TelescopeBorder" })
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function ()
            require('noice').setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                    },
                    hover = {
                        opts = {
                            scrollbar = false,
                        },
                    },
                    signature = {
                        opts = {
                            scrollbar = false,
                        },
                    },
                },
                presets = {
                    bottom_search = true,
                    command_palette = false,
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = false,
                },
                cmdline = {
                    view = "cmdline",
                    format = {
                        input = { view = "cmdline" },
                        cmdline = { icon = " " },
                    }
                },
                popupmenu = {
                    enabled = false,
                },
            })
        end
    },
}
