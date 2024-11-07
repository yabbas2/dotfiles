local map = vim.keymap.set

-- map('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- map('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- map('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- map('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })

-- map('n', '<M-]>', ':bnext<CR>', { noremap = true, silent = true })
-- map('n', '<M-[>', ':bprevious<CR>', { noremap = true, silent = true })

map("v", "J", ":move '>+1<CR>gv=gv", { desc = 'Move text down' })
map("v", "K", ":move '<-2<CR>gv=gv", { desc = 'Move text up' })

map("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
map("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
map("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
map("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

map("n", "sh", ":vsplit<Return>", { noremap = true, silent = true })
map("n", "sv", ":split<Return>", { noremap = true, silent = true })

map("n", "<Leader>hh", '<Cmd>set hlsearch!<CR>', { silent = true })

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
