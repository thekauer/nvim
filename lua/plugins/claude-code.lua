return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    keys = {
      { "<C-p>", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code (Ctrl+,)", mode = { "n", "x", "t" } },
    },
    opts = {
      terminal = {
        snacks_win_opts = {
          position = "float",
          width = 0.85,
          height = 0.85,
          border = "rounded",
          keys = {
            claude_hide_ctrl = {
              "<C-p>",
              function(self)
                self:hide()
              end,
              mode = "t",
              desc = "Hide (Ctrl+,)",
            },
            claude_hide_esc = {
              "<C-\\><C-n>",
              function(self)
                self:hide()
              end,
              mode = "t",
              desc = "Hide (Ctrl+\\)",
            },
          },
        },
      },
    },
  },
}
