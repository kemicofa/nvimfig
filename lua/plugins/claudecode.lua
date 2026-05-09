return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>",           desc = "Toggle Claude" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        mode = "v", desc = "Send selection to Claude" },
    { "<leader>af", "<cmd>ClaudeCodeSend<cr>",        desc = "Send file to Claude" },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Reject diff" },
  },
  opts = {
    split_side = "right",
    split_width_percentage = 0.35,
    auto_close = true,
  },
}
