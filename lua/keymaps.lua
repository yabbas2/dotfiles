-- define common options
local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<F9>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<F10>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<F11>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<F12>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<F2>', ':bnext<CR>', opts)
vim.keymap.set('n', '<F1>', ':bprevious<CR>', opts)
