local builtin = require('telescope.builtin')
local telescope = require("telescope")

telescope.load_extension("live_grep_args")

vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fg', ":Telescope live_grep_args<CR>", {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fs', builtin.lsp_document_symbols, {})
