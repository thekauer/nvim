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
    ["folke/tokyonight.nvim"] = {
        config = function()
            require "custom.plugins.configs.tokyonight"
        end
    },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    requires = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("custom.plugins.configs.null-ls")
    end
  },
  ["ggandor/lightspeed.nvim"] = {}, 
  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
    as = "lsp_lines",
    config = function()
      require("lsp_lines").setup()
      vim.keymap.set(
        "",
        "<Leader>l",
        require("lsp_lines").toggle,
        { desc = "Toggle lsp_lines" }
      )
      vim.diagnostic.config({
        virtual_text = false,
      })
    end
  },

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

