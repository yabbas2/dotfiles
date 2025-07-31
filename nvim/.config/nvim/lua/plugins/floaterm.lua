return {
    "nvzone/floaterm",
    dependencies = "nvzone/volt",
    config = function()
        require("floaterm").setup({
            border = true,
            autoinsert = false,
            mappings = {
                sidebar = function(buf)
                    vim.keymap.set({'n', 't'}, '<C-h>', require('floaterm.api').switch_wins, { buffer = buf })
                    vim.keymap.set({'n', 't'}, '<C-l>', require('floaterm.api').switch_wins, { buffer = buf })
                    vim.keymap.set('n', '<esc>', "<CMD>FloatermToggle<CR>", { buffer = buf })
                end,
                term = function(buf)
                    vim.keymap.set({'n', 't'}, '<C-h>', require('floaterm.api').switch_wins, { buffer = buf })
                    vim.keymap.set({'n', 't'}, '<C-l>', require('floaterm.api').switch_wins, { buffer = buf })
                    vim.keymap.set('n', '<esc>', "<CMD>FloatermToggle<CR>", { buffer = buf })
                end,
            }
        })
    end,
    keys = {
        { "<leader>tt", "<CMD>FloatermToggle<CR>", desc = "Floaterm Toggle" },
    }
}
