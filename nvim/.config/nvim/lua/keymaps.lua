-- define common options
local opts = {
    noremap = true,
    silent = true,
}

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- vim.keymap.set('n', '<M-]>', ':bnext<CR>', opts)
-- vim.keymap.set('n', '<M-[>', ':bprevious<CR>', opts)

vim.keymap.set("v", "<Leader>j", ":m .+1<CR>==", { desc = 'Move text down' })
vim.keymap.set("v", "<Leader>k", ":m .-2<CR>==", { desc = 'Move text up' })
vim.keymap.set("n", "<Leader>j", ":m .+1<CR>==", { desc = 'Move text down' })
vim.keymap.set("n", "<Leader>k", ":m .-2<CR>==", { desc = 'Move text up' })

vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })

vim.keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
vim.keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
vim.keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
vim.keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

vim.keymap.set("n", "sh", ":vsplit<Return>", opts)
vim.keymap.set("n", "sv", ":split<Return>", opts)

vim.keymap.set("n", "<Leader>hh", '<Cmd>set hlsearch!<CR>', { silent = true })
