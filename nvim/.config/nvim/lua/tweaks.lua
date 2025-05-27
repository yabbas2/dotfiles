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

vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        if vim.fn.has('macunix') then os.execute("dot_clean -m " .. vim.fn.expand('%:h')) end
    end
})
