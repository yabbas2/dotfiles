return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-live-grep-args.nvim"
    },
    config = function ()
        local builtin = require('telescope.builtin')
        local telescope = require("telescope")
        local lga_actions = require("telescope-live-grep-args.actions")
        local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

        telescope.setup {
            extensions = {
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                        },
                    },
                }
            }
        }

        telescope.load_extension("live_grep_args")

        vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<Leader>fs', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<Leader>fd', builtin.lsp_definitions, {})
        vim.keymap.set('n', '<Leader>fr', builtin.lsp_references, {})
        vim.keymap.set('n', '<Leader>fg', function() telescope.extensions.live_grep_args.live_grep_args() end, {})
        vim.keymap.set('v', '<Leader>fv', live_grep_args_shortcuts.grep_visual_selection, {})
        vim.keymap.set('v', '<Leader>flv', live_grep_args_shortcuts.grep_word_visual_selection_current_buffer, {})
        vim.keymap.set('n', '<Leader>fw', live_grep_args_shortcuts.grep_word_under_cursor, {})
        vim.keymap.set('n', '<Leader>flw', live_grep_args_shortcuts.grep_word_under_cursor_current_buffer, {})
    end
}
