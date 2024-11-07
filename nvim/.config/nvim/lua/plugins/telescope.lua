return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-symbols.nvim",
    },
    event = "VeryLazy",
    config = function ()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local lga_actions = require("telescope-live-grep-args.actions")
        local themes = require("telescope.themes")

        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                    },
                    n = {
                        ["<C-D>"] = actions.delete_buffer,
                    }
                },
                layout_strategy = 'vertical',
                prompt_prefix = "  ",
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                        },
                    },
                },
                ["ui-select"] = {
                    themes.get_dropdown()
                },
            },
            pickers = {
                find_files = { initial_mode = "insert" },
                buffers = { initial_mode = "normal", previewer = false, theme = "dropdown"},
                lsp_references = { initial_mode = "normal" },
                lsp_definitions = { initial_mode = "normal" },
                lsp_document_symbols = { initial_mode = "insert" },
            },
        }

        telescope.load_extension("live_grep_args")
        telescope.load_extension("ui-select")
    end,
    keys = {
        { '<Leader>ff', "<CMD>lua require('telescope.builtin').find_files({ no_ignore = true, hidden = true })<CR>", mode = { 'n' } },
        { '<Leader>fu', "<CMD>lua require('telescope.builtin').resume()<CR>", mode = { 'n' } },
        { '<Leader>fb', "<CMD>Telescope buffers<CR>", mode = { 'n' } },
        { '<Leader>fs', "<CMD>Telescope lsp_document_symbols<CR>", mode = { 'n' } },
        { '<Leader>fd', "<CMD>Telescope lsp_definitions<CR>", mode = { 'n' } },
        { '<Leader>fr', "<CMD>Telescope lsp_references<CR>", mode = { 'n' } },
        { '<Leader>fg', "<CMD>Telescope live_grep_args<CR>", mode = { 'n' } },
        { '<Leader>fv', "<CMD>lua require('telescope-live-grep-args.shortcuts').grep_visual_selection()<CR>", mode = { 'v' } },
        { '<Leader>fw', "<CMD>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>", mode = { 'n' } },
        { '<Leader>flv', "<CMD>lua require('telescope-live-grep-args.shortcuts').grep_word_visual_selection_current_buffer()<CR>", mode = { 'v' } },
        { '<Leader>flw', "<CMD>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor_current_buffer()<CR>", mode = { 'n' } },
        { '<Leader>fa', "<CMD>Telescope session-lens<CR>", mode = { 'n' } },
        { '<Leader>ft', "<CMD>TodoTelescope<CR>", mode = { 'n' } },
        { '<Leader>fm', "<CMD>Telescope symbols<CR>", mode = { 'n' } },
    }
}
