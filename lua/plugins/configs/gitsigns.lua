local present, gitsigns = pcall(require, "gitsigns")

if not present then
    return
end

local options = {
    signs = {
        add = {
            hl = "DiffAdd",
            text = "│",
            numhl = "GitSignsAddNr"
        },
        change = {
            hl = "DiffChange",
            text = "│",
            numhl = "GitSignsChangeNr"
        },
        delete = {
            hl = "DiffDelete",
            text = "",
            numhl = "GitSignsDeleteNr"
        },
        topdelete = {
            hl = "DiffDelete",
            text = "‾",
            numhl = "GitSignsDeleteNr"
        },
        changedelete = {
            hl = "DiffChangeDelete",
            text = "~",
            numhl = "GitSignsChangeNr"
        }
    },
    on_attach = function(bufnr)
        -- need mappings
        -- utils.load_mappings("gitsigns", {
        --     buffer = bufnr
        -- })
    end
}

gitsigns.setup(options)

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
