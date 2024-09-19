return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-live-grep-args.nvim"
    },
    config = function ()
        local builtin = require('telescope.builtin')
        local telescope = require("telescope")

        telescope.load_extension("live_grep_args")

        vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
        -- vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<Leader>fs', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<Leader>fd', builtin.lsp_definitions, {})
        vim.keymap.set('n', '<Leader>fr', builtin.lsp_references, {})
        vim.keymap.set('n', '<Leader>fg', ":Telescope live_grep_args<CR>", {})
    end
}
