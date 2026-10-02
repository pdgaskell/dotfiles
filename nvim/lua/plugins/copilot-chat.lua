return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
      use_tiktoken = false,
      show_help = false,
      model = "gpt-5.6-terra",
      tools = { "file", "buffer", "selection", "glob", "grep", "gitdiff", "edit" },
      trusted_tools = { "file", "buffer", "selection", "glob", "grep", "gitdiff" },
      mappings = {
        submit_prompt = {
          insert = "<C-g>",
        },
      },
      window = {
        layout = "vertical",
        width = 0.37,
      },
    },
  },
}
