return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-live-grep-args.nvim"
    },
    config = function ()
        local builtin = require('telescope.builtin')
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local lga_actions = require("telescope-live-grep-args.actions")
        local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                    }
                },
            },
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                        },
                    },
                }
            },
        }

        telescope.load_extension("live_grep_args")

        vim.keymap.set('n', '<Leader>ff', function() builtin.find_files() end, {})
        vim.keymap.set('n', '<Leader>fb', function() builtin.buffers() end, {})
        vim.keymap.set('n', '<Leader>fs', function() builtin.lsp_document_symbols() end, {})
        vim.keymap.set('n', '<Leader>fd', function() builtin.lsp_definitions() end, {})
        vim.keymap.set('n', '<Leader>fr', function() builtin.lsp_references() end, {})
        vim.keymap.set('n', '<Leader>fg', function() telescope.extensions.live_grep_args.live_grep_args() end, {})
        vim.keymap.set('v', '<Leader>fv', live_grep_args_shortcuts.grep_visual_selection, {})
        vim.keymap.set('v', '<Leader>flv', live_grep_args_shortcuts.grep_word_visual_selection_current_buffer, {})
        vim.keymap.set('n', '<Leader>fw', live_grep_args_shortcuts.grep_word_under_cursor, {})
        vim.keymap.set('n', '<Leader>flw', live_grep_args_shortcuts.grep_word_under_cursor_current_buffer, {})
    end
}
