require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyomoon',
        -- component_separators = { left = '', right = ''},
        component_separators = {
            left = '╲',
            right = '╱'
        },
        -- section_separators = { left = '', right = ''},
        section_separators = {
            left = '',
            right = ''
        },
        disabled_filetypes = {'NvimTree'},
        always_divide_middle = true,
        globalstatus = false
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat'},
        lualine_y = {'filetype'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
