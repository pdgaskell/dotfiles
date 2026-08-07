return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "latte",
        })
        vim.cmd.colorscheme("catppuccin-latte")
        vim.api.nvim_set_hl(0, "ComplHint", { fg = "#8c8fa1" })
        vim.api.nvim_set_hl(0, "ComplHintMore", { fg = "#9ca0b0", italic = true })
    end,
}
