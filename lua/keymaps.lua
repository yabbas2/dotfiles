-- define common options
local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', 'J', ':resize -2<CR>', opts)
vim.keymap.set('n', 'K', ':resize +2<CR>', opts)
vim.keymap.set('n', 'H', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', 'L', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', 'b]', ':bnext<CR>', opts)
vim.keymap.set('n', 'b[', ':bprevious<CR>', opts)

vim.keymap.set("v", "<M-j>", ":m .+1<CR>==", { desc = 'Move text down' })
vim.keymap.set("v", "<M-k>", ":m .-2<CR>==", { desc = 'Move text up' })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = 'Move text down' })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = 'Move text up' })
