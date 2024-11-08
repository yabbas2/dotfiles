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

map("v", "J", "<CMD>move '>+1<CR>gv=gv", { desc = 'Move text down' })
map("v", "K", "<CMD>move '<-2<CR>gv=gv", { desc = 'Move text up' })

map("n", "<M-h>", '<CMD>lua require("tmux").resize_left()<CR>', { silent = true })
map("n", "<M-j>", '<CMD>lua require("tmux").resize_bottom()<CR>', { silent = true })
map("n", "<M-k>", '<CMD>lua require("tmux").resize_top()<CR>', { silent = true })
map("n", "<M-l>", '<CMD>lua require("tmux").resize_right()<CR>', { silent = true })

map("n", "sh", "<CMD>vsplit<Return>", { noremap = true, silent = true })
map("n", "sv", "<CMD>split<Return>", { noremap = true, silent = true })

map("n", "<Leader>hh", '<CMD>set hlsearch!<CR>', { silent = true })

map({ "n", "x" }, "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true, desc = 'Move down in wrapped text' })
map({ "n", "x" }, "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true, desc = 'Move up in wrapped text'})

map("n", "<C-u>", "<C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>", { desc = 'Scroll smoothly up' })
map("n", "<C-d>", "<C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>", { desc = 'Scroll smoothly down' })

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
