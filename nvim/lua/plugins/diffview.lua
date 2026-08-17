return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggle", "DiffviewFileHistory" },
    opts = {
      enhanced_diff_hl = true, -- See better diff highlights
      view = {
        default = { layout = "diff2_horizontal" },
        merge_tool = { layout = "diff3_mixed" }, -- Better layout for three-way merges
      },
    },
  },
}

