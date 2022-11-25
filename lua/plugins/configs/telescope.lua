local present, telescope = pcall(require, "telescope")

if not present then
    return
end

vim.g.theme_switcher_loaded = true

local options = {
    defaults = {
        vimgrep_arguments = {"rg", "-L", "--color=never", "--no-heading", "--with-filename", "--line-number",
                             "--column", "--smart-case"},
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8
            },
            vertical = {
                mirror = false
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {"node_modules"},
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = {"truncate"},
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        set_env = {
            ["COLORTERM"] = "truecolor"
        }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = {
                ["q"] = require("telescope.actions").close
            }
        }
    },

    extensions_list = {"themes", "terms"}
}

telescope.setup(options)

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
vim.keymap.set("n", "<leader>tk", "<cmd> Telescope keymaps <CR>", {
    desc = "show keys"
})

vim.keymap.set("n", "<leader>cm", "<cmd> Telescope git_commits <CR>", {
    desc = "git commits"
})
vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status <CR>", {
    desc = "git status"
})

vim.keymap.set("n", "<leader>pt", "<cmd> Telescope terms <CR>", {
    desc = "pick hidden term"
})

-- -- load extensions
pcall(function()
    for _, ext in ipairs(options.extensions_list) do
        telescope.load_extension(ext)
    end
end)
