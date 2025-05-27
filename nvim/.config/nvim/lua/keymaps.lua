local map = vim.keymap.set

-- map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
map("n", "<C-h>", "<CMD>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<CMD>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<CMD>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<CMD>NvimTmuxNavigateRight<CR>", { silent = true })

map({ 'n', 'i' }, '<F2>', '<CMD>bnext<CR>', { noremap = true, silent = true })
map({ 'n', 'i' }, '<F1>', '<CMD>bprevious<CR>', { noremap = true, silent = true })
map({ 'n', 'i' }, '<F4>', '<CMD>tabnext<CR>', { noremap = true, silent = true })
map({ 'n', 'i' }, '<F3>', '<CMD>tabprevious<CR>', { noremap = true, silent = true })

map("v", "J", ":move '>+1<CR>gv=gv", { desc = 'Move text down' })
map("v", "K", ":move '<-2<CR>gv=gv", { desc = 'Move text up' })

map("n", "<M-LEFT>", '<CMD>lua require("tmux").resize_left()<CR>', { silent = true })
map("n", "<M-DOWN>", '<CMD>lua require("tmux").resize_bottom()<CR>', { silent = true })
map("n", "<M-UP>", '<CMD>lua require("tmux").resize_top()<CR>', { silent = true })
map("n", "<M-RIGHT>", '<CMD>lua require("tmux").resize_right()<CR>', { silent = true })

map("n", "<leader>sh", "<CMD>vsplit<CR>", { noremap = true, silent = true })
map("n", "<leader>sv", "<CMD>split<CR>", { noremap = true, silent = true })

map("n", "<Leader>hh", '<CMD>set hlsearch!<CR>', { silent = true })

map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true, desc = 'Move down in wrapped text' })
map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true, desc = 'Move up in wrapped text' })

map({ "n", "v" }, "H", "^", { desc = 'Move to beginning of line' })
map({ "n", "v" }, "L", "g_", { desc = 'Move to end of line' })

map("n", "i", function()
    if #vim.fn.getline "." == 0 then
        return [["_cc]]
    else
        return "i"
    end
end, { expr = true, desc = 'Respect indentation' })

map("v", "<", "<gv", { desc = "Keep visual selection when indenting to left" })
map("v", ">", ">gv", { desc = "Keep visual selection when indenting to right" })

map("n", "<leader>;", "mmA;<ESC>`m<CMD>delm m<CR>", { desc = "Append semicolon" })
map("n", "<leader>,", "mmA,<ESC>`m<CMD>delm m<CR>", { desc = "Append comma" })

map("n", "gV", "`[v`]", { desc = "Reselect last yanked area" })

map("v", "<leader>re", '"hy:%s/<C-r>h/<C-r>h/gc<left><left><left>',
    { desc = "Open search and replace for currently selected text" })
map("n", "<leader>re", ":%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>",
    { desc = "Open search and replace for word under cursor" })

map("n", "<leader>*", "*Ncgn", { desc = "Change word with . repeat" })

map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal" })

map("n", "<leader>w", "<CMD>w<CR>", { desc = "Save buffer" })
