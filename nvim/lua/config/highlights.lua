local group = vim.api.nvim_create_augroup("extra-whitespace", { clear = true })

local function highlight_extra_whitespace()
    vim.cmd([[highlight ExtraWhitespace ctermbg=lightred guibg=lightred]])

    if vim.w.extra_whitespace_match_id then
        vim.fn.matchdelete(vim.w.extra_whitespace_match_id)
    end

    vim.w.extra_whitespace_match_id = vim.fn.matchadd(
        "ExtraWhitespace",
        [[\(\t\+\|\s\+$\)]]
    )
end

highlight_extra_whitespace()

vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "ColorScheme" }, {
    group = group,
    callback = highlight_extra_whitespace,
})
