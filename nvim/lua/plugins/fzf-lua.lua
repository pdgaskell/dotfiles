return {
    "ibhagwan/fzf-lua",
    keys = {
        { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
        { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
        { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Find buffers" },
        { "<leader>fh", function() require("fzf-lua").help_tags() end, desc = "Find help" },
    },
    config = function()
        require("fzf-lua").setup({})
    end,
}
