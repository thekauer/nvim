-- n, v, i, t = mode names
local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- TODO: last parameter is opts, description should be opst.desc, opts is {}
vim.keymap.set("i", "<C-b>", "<ESC>^i", {
  desc = "beginning of line"
})
vim.keymap.set("i", "<C-e>", "<End>", {
  desc = "end of line"
})

vim.keymap.set("i", "jk", "<ESC>", {
  nowait = true,
  desc = "escape insert mode"
})

vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>", {
  desc = "no highlight"
})

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", {
  desc = "window left"
})
vim.keymap.set("n", "<C-l>", "<C-w>l", {
  desc = "window right"
})
vim.keymap.set("n", "<C-j>", "<C-w>j", {
  desc = "window down"
})
vim.keymap.set("n", "<C-k>", "<C-w>k", {
  desc = "window up"
})

-- save
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", {
  desc = "save file"
})
vim.keymap.set("i", "<C-s>", "<ESC><cmd> w <CR>", {
  desc = "save file"
})

-- Copy all
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", {
  desc = "copy whole file"
})

-- line numbers
vim.keymap.set("n", "<leader>n", "<cmd> set nu! <CR>", {
  desc = "toggle line number"
})
vim.keymap.set("n", "<leader>rn", "<cmd> set rnu! <CR>", {
  desc = "toggle relative number"
})

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
vim.keymap.set("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {
  expr = true,
  desc = "move down"
})
vim.keymap.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {
  expr = true,
  desc = "move up"
})
vim.keymap.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {
  expr = true,
  desc = "move up"
})
vim.keymap.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {
  expr = true,
  desc = "move down"
})

-- new buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", {
  desc = "new buffer"
})

-- terminal mode
vim.keymap.set("t", "<C-x>", termcodes("<C-\\><C-N>"), {
  desc = "escape terminal mode"
})
vim.keymap.set("t", "jk", termcodes("<C-\\><C-N>"), {
  nowait = true,
  desc = "escape terminal mode"
})

-- visual mode

vim.keymap.set("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {
  expr = true,
  desc = "move up"
})
vim.keymap.set("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {
  expr = true,
  desc = "move down"
})

-- visual block mode

vim.keymap.set("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {
  expr = true,
  desc = "move down"
})
vim.keymap.set("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {
  expr = true,
  desc = "move up"
})

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
  silent = true,
  desc = "paste"
})

-- telescope

vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <CR>", {
  desc = "find files"
})
vim.keymap.set("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", {
  desc = "find all"
})
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", {
  desc = "live grep"
})
vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>", {
  desc = "find buffers"
})
vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags <CR>", {
  desc = "help page"
})
vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", {
  desc = "find oldfiles"
})
vim.keymap.set("n", "<leader>ks", "<cmd> Telescope keymaps <CR>", {
  desc = "show keys"
})

vim.keymap.set("n", "<leader>gc", "<cmd> Telescope git_commits <CR>", {
  desc = "git commits"
})
vim.keymap.set("n", "<leader>gs", "<cmd> Telescope git_status <CR>", {
  desc = "git status"
})

vim.keymap.set("n", "<leader>th", "<cmd> Telescope colorscheme <CR>", {
  desc = "theme"
})

-- gitsigns

vim.keymap.set("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, {
  desc = "Jump to next hunk",
  expr = true
})

vim.keymap.set("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, {
  desc = "Jump to prev hunk",
  expr = true
})

vim.keymap.set("n", "<leader>rh", function()
  require("gitsigns").reset_hunk()
end, {
  desc = "Reset hunk"
})

vim.keymap.set("n", "<leader>ph", function()
  require("gitsigns").preview_hunk()
end, {
  desc = "Preview hunk"
})

vim.keymap.set("n", "<leader>gb", function()
  package.loaded.gitsigns.blame_line()
end, {
  desc = "Blame line"
})

vim.keymap.set("n", "<leader>td", function()
  require("gitsigns").toggle_deleted()
end, {
  desc = "Toggle deleted"
})

-- lspconfig

vim.keymap.set('n', 'gD', function()
  vim.lsp.buf.declaration()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', 'gd', function()
  vim.lsp.buf.definition()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', 'gi', function()
  vim.lsp.buf.implementation()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>ls', function()
  vim.lsp.buf.signature_help()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>D', function()
  vim.lsp.buf.type_definition()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>ca', function()
  vim.lsp.buf.code_action()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', 'gr', function()
  vim.lsp.buf.references()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>f', function()
  vim.diagnostic.open_float()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '[d', function()
  vim.diagnostic.goto_prev()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', 'd]', function()
  vim.diagnostic.goto_next()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>q', function()
  vim.diagnostic.setloclist()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>fm', function()
  vim.lsp.buf.format {
    async = true
  }
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>wa', function()
  vim.lsp.buf.add_workspace_folder()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>wr', function()
  vim.lsp.buf.remove_workspace_folder()
end, {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, {
  silent = true,
  noremap = true
})

-- nvimtree

vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", {
  desc = "toggle nvimtree"
})
vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", {
  desc = "focus nvimtree"
})


-- copilot

vim.keymap.set("n", "<leader>ce", "<cmd> Copilot enable <CR>", {
  desc = "toggle copilot"
})

vim.keymap.set("n", "<leader>cd", "<cmd> Copilot disable <CR>", {
  desc = "toggle copilot"
})

vim.api.nvim_set_keymap('i', '<M-k>', 'copilot#Accept("<CR>")', {
  expr = true,
  silent = true,
  desc = "copilot accept suggestion"
})

vim.keymap.set('i', '<M-f>', '<Plug>(copilot-suggest)', {
  desc = "copilot suggest"
})
