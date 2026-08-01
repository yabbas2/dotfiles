vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
require("nvim-treesitter").setup()

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' })
require("nvim-treesitter-textobjects").setup {
    select = {
        lookahead = true,
        selection_modes = {
            ['@function.inner'] = 'V',
            ['@function.outer'] = 'V',
            ['@conditional.outer'] = 'V',
            ['@conditional.inner'] = 'V',
        },
        include_surrounding_whitespace = false,
    },
    move = {
        set_jumps = true,
    },
}

local select = require("nvim-treesitter-textobjects.select")
local swap = require("nvim-treesitter-textobjects.swap")
local move = require("nvim-treesitter-textobjects.move")
local select_q = function(q)
    return function() select.select_textobject(q, "textobjects") end
end
local maps = {
    ["af"] = "@function.outer",
    ["if"] = "@function.inner",
    ["ac"] = "@class.outer",
    ["ic"] = "@class.inner",
    ["ab"] = "@block.outer",
    ["ib"] = "@block.inner",
    ["ad"] = "@conditional.outer",
    ["id"] = "@conditional.inner",
    ["al"] = "@loop.outer",
    ["il"] = "@loop.inner",
    ["ap"] = "@parameter.outer",
    ["ip"] = "@parameter.inner",
    ["am"] = "@comment.outer",
    ["im"] = "@comment.inner",
}
for k, q in pairs(maps) do
    vim.keymap.set({ "x", "o" }, k, select_q(q))
end

vim.keymap.set("n", "<leader>sn", function() swap.swap_next("@parameter.inner") end)
vim.keymap.set("n", "<leader>sp", function() swap.swap_previous("@parameter.inner") end)

vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer") end)
vim.keymap.set({ "n", "x", "o" }, "]p", function() move.goto_next_start("@parameter.inner") end)
vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer") end)
vim.keymap.set({ "n", "x", "o" }, "[p", function() move.goto_previous_start("@parameter.inner") end)
