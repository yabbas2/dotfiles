return {
  'stevearc/overseer.nvim',
  opts = {},

  vim.keymap.set('n', '<leader>or',  "<cmd>OverseerRun<CR>", {}),
  -- vim.keymap.set('n', '<leader>ot',  "<cmd>OverseerToggle<CR>", {}),
  -- vim.keymap.set('n', '<leader>oo',  "<cmd>OverseerOpen<CR>", {}),
  -- vim.keymap.set('n', '<leader>oc',  "<cmd>OverseerClose<CR>", {}),
}
