return {
    ["github/copilot.vim"] = {
        branch = "release",
        config = function()
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_enabled = true
        end
    },
    ["kyazdani42/nvim-web-devicons"] = {},
    ["nvim-lualine/lualine.nvim"] = {
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        },
        config = function()
            require 'custom.plugins.configs.lualine'
        end
    },
    ["max397574/better-escape.nvim"] = {
        config = function()
            require("better_escape").setup {
                mapping = {"jk"}, -- a table with mappings to use
                timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
                clear_empty_lines = false, -- clear line after escaping if there is only whitespace
                keys = "<Esc>" -- keys used for escaping, if it is a function will use the result everytime
            }
        end
    },
    ["folke/tokyonight.nvim"] = {
        config = function()
            require "custom.plugins.configs.tokyonight"
        end
    },
    -- ["~whynothugo/lsp_lines.nvim"] = {
    --     as = "lsp_lines",
    --     config = function()
    --         require("lsp_lines").setup()
    --     end
    -- },

    -- Deletes
    ["NvChad/ui"] = false,
    ["NvChad/base46"] = false,
    ["NvChad/nvterm"] = false,
    ["NvChad/nvim-colorizer.lua"] = false,
    ["goolord/alpha-nvim"] = false,

    -- Overrides 
    ["neovim/nvim-lspconfig"] = {
        config = function()
            require 'custom.plugins.configs.lspconfig'
        end
    },
    ["nvim-treesitter/nvim-treesitter"] = {
        config = function()
            require 'custom.plugins.configs.treesitter'
        end
    }
}

