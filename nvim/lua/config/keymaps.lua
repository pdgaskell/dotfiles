-- Copy filename with @ prefix (e.g., @index.js)
vim.keymap.set('n', '<leader>cf', function()
  local filename = '@' .. vim.fn.expand('%:t')
  vim.fn.setreg('+', filename)
  print("Copied for Copilot: " .. filename)
end, { desc = 'Copy filename with @ prefix for Copilot' })

-- Copy relative path with @ prefix (e.g., @src/main.js)
vim.keymap.set('n', '<leader>cc', function()
  local path = '@' .. vim.fn.expand('%:.')
  vim.fn.setreg('+', path)
  print("Copied for Copilot: " .. path)
end, { desc = 'Copy relative path with @ prefix for Copilot' })

-- Copy filename with @ prefix and visual line range (e.g., @index.js:10-20)
vim.keymap.set('x', '<leader>cc', function()
  -- 1. Exit visual mode to update the '< and '> marks
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", true)

  -- 2. Schedule the execution so marks are guaranteed to be updated
  vim.schedule(function()
    -- Get starting and ending line numbers of the visual selection
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    -- Get just the filename (use '%' instead of '%:t' if you prefer relative paths)
    local filename = vim.fn.expand('%:.')

    -- Format string as @filename:start-end
    local result = string.format("@%s:%d-%d", filename, start_line, end_line)

    -- Copy to the system clipboard
    vim.fn.setreg('+', result)
    print("Copied for Copilot: " .. result)
  end)
end, { desc = 'Copy filename with line range for Copilot' })

