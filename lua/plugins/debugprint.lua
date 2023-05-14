return {
  {
    "andrewferrier/debugprint.nvim",
    event = "VeryLazy",
    config = function()
      require("debugprint").setup({
        create_keymaps = false,
        create_commands = false,
      })

      vim.keymap.set("n", "gl", function()
        return require("debugprint").debugprint({ variable = true })
      end, { expr = true, desc = "log variable under cursor" })
      vim.keymap.set("n", "gL", function()
        return require("debugprint").debugprint({ above = true, variable = true })
      end, { expr = true, desc = "log variable under cursor, above the line" })
    end,
  },
}
