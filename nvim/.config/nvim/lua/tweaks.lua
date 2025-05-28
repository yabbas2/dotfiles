-- clipboard for WSL
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ["+"] = { 'clip.exe' },
            ["*"] = { 'clip.exe' },
        },
        paste = {
            ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end

-- Dot files clean on MAC
local dotclean_state = false
vim.api.nvim_create_user_command('DotcleanToggle', function()
    if vim.fn.has('macunix') then
        print("Dotclean is " .. (dotclean_state and "OFF" or "ON"))
        if not dotclean_state then
            vim.api.nvim_create_autocmd("BufWritePost", {
                group = vim.api.nvim_create_augroup('tweaks', { clear = true }),
                callback = function()
                    if vim.fn.has('macunix') then os.execute("dot_clean -m " .. vim.fn.expand('%:h')) end
                end
            })
        else
            vim.api.nvim_clear_autocmds({group = "tweaks"})
        end
    else
        print("Dotclean is not supported on this platform")
    end
    dotclean_state = not dotclean_state
end, {})

-- Auto-reload buffers when files get changed externally
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
    command = "lua vim.notify('File changed on disk. Buffer reloaded.', vim.log.levels.INFO)",
    pattern = { "*" },
})
