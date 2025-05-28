return {
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "abeldekat/cmp-mini-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require('lspkind')

            cmp.setup({
                snippet = {
                    expand = function(args)
                        local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        insert({ body = args.body })
                        cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        require("cmp.config").set_onetime({ sources = {} })
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-n>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<C-p>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                formatting = {
                    format = lspkind.cmp_format({ mode = "replace", }),
                },
                sources = {
                    { name = "nvim_lsp", },
                    { name = "mini_snippets", },
                    { name = "buffer", },
                    { name = "render-markdown", },
                    { name = "path", },
                },
                window = {
                    completion = cmp.config.window.bordered({
                        border = "single",
                        scrollbar = true,
                        side_padding = 1,
                    }),
                    documentation = cmp.config.window.bordered({
                        border = "single",
                        scrollbar = true,
                        side_padding = 1,
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
            vim.lsp.config('*', {
                capabilities = vim.tbl_deep_extend('keep', vim.lsp.protocol.make_client_capabilities(),
                    require("cmp_nvim_lsp").default_capabilities())
            })
        end,
    },
}
