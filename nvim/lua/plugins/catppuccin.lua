return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            -- "auto" follows vim.o.background, which nvim sets from the terminal
            background = { light = "latte", dark = "mocha" },
            custom_highlights = function(colors)
                return {
                    ComplHint = { fg = colors.overlay1 },
                    ComplHintMore = { fg = colors.overlay0, italic = true },
                }
            end,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
