vim.lsp.enable({
    'clangd',
    'pylsp',
    'lua_ls',
    'lemminx',
    'jsonls',
})

vim.diagnostic.config({
    virtual_text = {
        current_line = true
    },
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅙 ",
            [vim.diagnostic.severity.WARN] = "󰀦 ",
            [vim.diagnostic.severity.HINT] = "󰋗 ",
            [vim.diagnostic.severity.INFO] = "󰋼 ",
        }
    },
    float = {
        border = "single",
        source = true,
    }
})

vim.keymap.set('n', "gld", function() vim.diagnostic.open_float() end, { desc = "Show diagnostics" })
vim.keymap.set('n', "grf", function() vim.lsp.buf.format() end, { desc = "Format buffer" })

-- TODO: add lsp restart/stop/start cmds

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        -- TODO: implement
    end
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = "single"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
