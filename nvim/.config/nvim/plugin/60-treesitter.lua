vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('my.treesitter', { clear = true }),
    callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if not ok then return end

        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

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
local query_group = "textobjects"
local select_q = function(q)
    return function() select.select_textobject(q, query_group) end
end
local maps = {
    ["af"] = { query = "@function.outer", desc = "Select around function" },
    ["if"] = { query = "@function.inner", desc = "Select inside function" },
    ["ac"] = { query = "@class.outer", desc = "Select around class" },
    ["ic"] = { query = "@class.inner", desc = "Select inside class" },
    ["ab"] = { query = "@block.outer", desc = "Select around block" },
    ["ib"] = { query = "@block.inner", desc = "Select inside block" },
    ["ad"] = { query = "@conditional.outer", desc = "Select around conditional" },
    ["id"] = { query = "@conditional.inner", desc = "Select inside conditional" },
    ["al"] = { query = "@loop.outer", desc = "Select around loop" },
    ["il"] = { query = "@loop.inner", desc = "Select inside loop" },
    ["ap"] = { query = "@parameter.outer", desc = "Select around parameter" },
    ["ip"] = { query = "@parameter.inner", desc = "Select inside parameter" },
    ["am"] = { query = "@comment.outer", desc = "Select around comment" },
    ["im"] = { query = "@comment.inner", desc = "Select inside comment" },
}
for k, opts in pairs(maps) do
    vim.keymap.set({ "x", "o" }, k, select_q(opts.query), { desc = opts.desc })
end

vim.keymap.set("n", "<leader>sn", function() swap.swap_next("@parameter.inner") end, { desc = "Swap next parameter" })
vim.keymap.set("n", "<leader>sp", function() swap.swap_previous("@parameter.inner") end,
    { desc = "Swap previous parameter" })
vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", query_group) end,
    { desc = "Next function start" })
vim.keymap.set({ "n", "x", "o" }, "]p", function() move.goto_next_start("@parameter.inner", query_group) end,
    { desc = "Next parameter start" })
vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", query_group) end,
    { desc = "Previous function start" })
vim.keymap.set({ "n", "x", "o" }, "[p", function() move.goto_previous_start("@parameter.inner", query_group) end,
    { desc = "Previous parameter start" })
