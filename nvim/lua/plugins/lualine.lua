return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Adds file-type icons
    init = function()
      -- Forces a single, screen-wide status bar across the absolute bottom
      vim.opt.laststatus = 3
    end,
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = { left = "│", right = "│" }, -- Minimal line dividers
          section_separators = { left = "", right = "" },     -- No triangular blocks
          globalstatus = true,
        },
        sections = {
          lualine_a = { { "mode", fmt = function(str) return str:sub(1,1) end } }, -- Compact mode letter (N/I/V)
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } }, -- Path = 1 shows relative file paths
          lualine_x = { "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  }
