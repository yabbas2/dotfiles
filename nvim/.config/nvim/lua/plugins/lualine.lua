return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function ()
        local colors = {
            black        = '#1c1e26',
            white        = '#6C6F93',
            red          = '#F43E5C',
            green        = '#09F7A0',
            blue         = '#25B2BC',
            yellow       = '#F09383',
            gray         = '#9340cf',
            darkgray     = '#1A1C23',
            lightgray    = '#2E303E',
            inactivegray = '#1C1E26',
        }
        local lualine_theme = {
            normal = {
                a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
                b = {bg = colors.lightgray, fg = colors.white},
                c = {bg = colors.darkgray, fg = colors.white},
            },
            insert = {
                a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
                b = {bg = colors.lightgray, fg = colors.white},
                c = {bg = colors.darkgray, fg = colors.white}
            },
            visual = {
                a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
                b = {bg = colors.lightgray, fg = colors.white},
                c = {bg = colors.darkgray, fg = colors.white}
            },
            replace = {
                a = {bg = colors.red, fg = colors.black, gui = 'bold'},
                b = {bg = colors.lightgray, fg = colors.white},
                c = {bg = colors.darkgray, fg = colors.white}
            },
            command = {
                a = {bg = colors.green, fg = colors.black, gui = 'bold'},
                b = {bg = colors.lightgray, fg = colors.white},
                c = {bg = colors.darkgray, fg = colors.white}
            },
            inactive = {
                a = {bg = colors.inactivegray, fg = colors.lightgray, gui = 'bold'},
                b = {bg = colors.inactivegray, fg = colors.lightgray},
                c = {bg = colors.inactivegray, fg = colors.lightgray}
            }
        }

        require('lualine').setup {
            options = {
                theme  = lualine_theme,
            },
            sections = {
                lualine_b = {
                    'branch',
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = "󰝶 ",
                        },
                    },
                },
                lualine_c = { { 'filename', path = 2 } },
            },
            extensions = { 'nvim-tree', 'nvim-dap-ui' }
        }
    end
}
