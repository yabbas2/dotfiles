return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        require('lualine').setup {
            options = {
                theme  = "catppuccin",
                component_separators = '',
                section_separators = { left = '', right = '' },
                disabled_filetypes = { 'neo-tree', 'Outline' },
            },
            sections = {
                lualine_b = {
                    'branch',
                    {
                        "diagnostics",
                        symbols = {
                            error = "󰅙 ",
                            warn = "󰀦 ",
                            info = "󰋼 ",
                            hint = "󰋗 ",
                        },
                    },
                },
                lualine_c = { { 'filename', path = 2 } },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'filetype'},
                lualine_y = {},
                lualine_z = {}
            },
            extensions = { 'nvim-dap-ui', 'overseer', 'mason' },
            tabline = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {'tabs'},
                lualine_z = {'buffers'},
            }
        }
    end
}
