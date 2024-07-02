-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- make .roc files have the correct filetype
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.roc" },
  command = "set filetype=roc",
})

-- add roc tree-sitter
local parsers = require("nvim-treesitter.parsers").get_parser_configs()

parsers.roc = {
  install_info = {
    url = "https://github.com/faldor20/tree-sitter-roc",
    files = { "src/parser.c", "src/scanner.c" },
  },
}
