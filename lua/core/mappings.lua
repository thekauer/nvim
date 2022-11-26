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
