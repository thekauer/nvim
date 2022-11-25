-- n, v, i, t = mode names
local function termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.keymap.set("i", "<C-b>", "<ESC>^i", "beginning of line")
vim.keymap.set("i", "<C-e>", "<End>", "end of line")

vim.keymap.set("i", "jk", "<ESC>", "escape insert mode", {
    nowait = true
})

vim.keymap.set("n", "<ESC>", "<cmd> noh <CR>", "no highlight")

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", "window left")
vim.keymap.set("n", "<C-l>", "<C-w>l", "window right")
vim.keymap.set("n", "<C-j>", "<C-w>j", "window down")
vim.keymap.set("n", "<C-k>", "<C-w>k", "window up")

-- save
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", "save file")

-- Copy all
vim.keymap.set("n", "<C-c>", "<cmd> %y+ <CR>", "copy whole file")

-- line numbers
vim.keymap.set("n", "<leader>n", "<cmd> set nu! <CR>", "toggle line number")
vim.keymap.set("n", "<leader>rn", "<cmd> set rnu! <CR>", "toggle relative number")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
vim.keymap.set("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", {
    expr = true
})
vim.keymap.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", {
    expr = true
})
vim.keymap.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", {
    expr = true
})
vim.keymap.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", {
    expr = true
})

-- new buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", "new buffer")

-- terminal mode
vim.keymap.set("t", "<C-x>", termcodes("<C-\\><C-N>"), "escape terminal mode")
vim.keymap.set("t", "jk", termcodes("<C-\\><C-N>"), "escape terminal mode", {
    nowait = true
})

-- visual mode

vim.keymap.set("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", {
    expr = true
})
vim.keymap.set("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", {
    expr = true
})

-- visual block mode

vim.keymap.set("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", {
    expr = true
})
vim.keymap.set("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", {
    expr = true
})

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', "paste", {
    silent = true
})
