local colors = require("tokyonight.colors").setup({
    transform = true

})
return {
    normal = {
        a = {
            bg = colors.magenta,
            fg = colors.black,
            gui = 'bold'
        },
        b = {
            bg = colors.fg_gutter,
            fg = colors.magenta
        },
        c = {
            bg = colors.none,
            fg = colors.fg_sidebar
        }
    },

    insert = {
        a = {
            bg = colors.green,
            fg = colors.black,
            gui = 'bold'
        },
        b = {
            bg = colors.fg_gutter,
            fg = colors.green
        }
    },

    command = {
        a = {
            bg = colors.yellow,
            fg = colors.black,
            gui = 'bold'
        },
        b = {
            bg = colors.fg_gutter,
            fg = colors.yellow,
            gui = 'bold'
        }
    },

    visual = {
        a = {
            bg = colors.magenta,
            fg = colors.black,
            gui = 'bold'
        },
        b = {
            bg = colors.fg_gutter,
            fg = colors.magenta,
            gui = 'bold'
        }
    },

    replace = {
        a = {
            bg = colors.red,
            fg = colors.black,
            gui = 'bold'
        },
        b = {
            bg = colors.fg_gutter,
            fg = colors.red
        }
    },

    inactive = {
        a = {
            bg = colors.bg_statusline,
            fg = colors.blue
        },
        b = {
            bg = colors.bg_statusline,
            fg = colors.fg_gutter,
            gui = "bold"
        },
        c = {
            bg = colors.bg_statusline,
            fg = colors.fg_gutter
        }
    }
}
