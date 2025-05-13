-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("i", "jk", "<Esc>", { desc = "Quickly exit normal mode" })
map("n", "WW", [[viw:<C-u>lua require('mini.surround').add('visual')<CR>]], { desc = "surround word under cursor" })
vim.keymap.set("n", "<leader>se", function()
  Snacks.picker.explorer({
    include = { "**/.env", "**/.env.*" },
    exclude = { "**" },
    tree = true,
  })
end, { desc = "Explore .env files" })
