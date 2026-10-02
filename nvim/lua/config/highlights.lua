local group = vim.api.nvim_create_augroup("user-trailing-whitespace", { clear = true })

-- Highlights trailing whitespace without accumulating matches after a reload.
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = group,
    pattern = "*",
    callback = function()
        if vim.w.trailing_whitespace_match_id then
            pcall(vim.fn.matchdelete, vim.w.trailing_whitespace_match_id)
        end

        vim.w.trailing_whitespace_match_id = vim.fn.matchadd("Special", [[\s\+$]])
    end,
})

-- Displays trailing spaces as dots.
vim.opt.list = true
vim.opt.listchars:append({ trail = "·" })
