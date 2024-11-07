return {
    "folke/noice.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
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
}
