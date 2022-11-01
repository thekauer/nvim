require("tokyonight").setup({
    transparent = true,

    on_colors = function(colors)
        -- colors.green = "#2df4c0"
    end,

    on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark
        }
        hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark
        }
        hl.TelescopePromptNormal = {
            bg = prompt
        }
        hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt
        }
        hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt
        }
        hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark
        }
        hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark
        }
    end
})
require('lualine').setup {
    options = {
        -- theme = 'tokyonight',
        transparent = true
    }
}

vim.api.nvim_set_hl(0, "Normal", {
    ctermfg = NONE,
    ctermbg = NONE
})
vim.api.nvim_set_hl(0, "LineNr", {
    guibg = NONE,
    ctermfg = NONE
})

-- gitSigns
vim.api.nvim_set_hl(0, "GitSignsAdd", {
    guibg = NONE
})
vim.api.nvim_set_hl(0, "GitSignsChange", {
    guibg = NONE
})
vim.api.nvim_set_hl(0, "GitSignsDelete", {
    guibg = NONE
})

vim.cmd [[colorscheme tokyonight]]
