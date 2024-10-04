return {
    {
        "onsails/lspkind-nvim",
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
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-cmdline"
        },
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

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
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable( -1) then
                            luasnip.jump( -1)
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
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },    -- For nvim-lsp
                    { name = 'luasnip' },     -- For luasnip user
                    { name = 'buffer' },      -- For buffer word completion
                    { name = 'path' },        -- For path completion
                }),
                window = {
                    completion = {
                        border = {
                            { "󱐋", "WarningMsg" },
                            { "─", "Comment" },
                            { "╮", "Comment" },
                            { "│", "Comment" },
                            { "╯", "Comment" },
                            { "─", "Comment" },
                            { "╰", "Comment" },
                            { "│", "Comment" },
                        },
                        scrollbar = false,
                        winblend = 0,
                    },
                    documentation = {
                        border = {
                            { "󰙎", "DiagnosticHint" },
                            { "─", "Comment" },
                            { "╮", "Comment" },
                            { "│", "Comment" },
                            { "╯", "Comment" },
                            { "─", "Comment" },
                            { "╰", "Comment" },
                            { "│", "Comment" },
                        },
                        scrollbar = false,
                        winblend = 0,
                    },
                }
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        opts = {
            history = true,
            region_check_events = "InsertEnter",
            delete_check_events = "TextChanged,InsertLeave",
        },
    },
}
