return {
    {
        "onsails/lspkind-nvim",
        event = "VeryLazy",
        config = function ()
           require('lspkind').setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local lspkind = require('lspkind')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs( -4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        menu = ({
                            nvim_lsp = '[Lsp]',
                            luasnip = '[Luasnip]',
                            buffer = '[File]',
                            path = '[Path]',
                        })
                    }),
                },
                sources = {
                    { name = "nvim_lsp", priority = 1000 },
                    { name = "luasnip", priority = 15 },
                    { name = "buffer", priority = 1 },
                    { name = "path" },
                },
                window = {
                    completion = cmp.config.window.bordered({
                        border = "none",
                        scrollbar = false,
                        side_padding = 1,
                        winhighlight = 'Normal:TelescopeNormal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
                    }),
                    documentation = cmp.config.window.bordered({
                        border = "none",
                        scrollbar = false,
                        side_padding = 1,
                        winhighlight = 'Normal:TelescopePromptNormal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
                    }),
                }
            })
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources {
                    { name = "path" },
                    { name = "cmdline" },
                },
            })
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        event = "VeryLazy",
        version = "v2.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function ()
            require("luasnip").setup()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {
        "rafamadriz/friendly-snippets",
        event = "VeryLazy",
    },
}
