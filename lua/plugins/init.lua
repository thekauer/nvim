local plugins = function(use)
    use {
        "nvim-lua/plenary.nvim",
        module = "plenary"
    }

    use {"lewis6991/impatient.nvim"}
    use 'wbthomason/packer.nvim'

    use {
        "nvim-treesitter/nvim-treesitter",
        module = "nvim-treesitter",
        setup = function()
            require("core.lazy_load").on_file_open "nvim-treesitter"
        end,
        cmd = require("core.lazy_load").treesitter_cmds,
        run = ":TSUpdate",
        config = function()
            require "plugins.configs.treesitter"
        end
    }

    use {
        "lewis6991/gitsigns.nvim",
        ft = "gitcommit",
        setup = function()
            require("core.lazy_load").gitsigns()
        end,
        config = function()
            require "plugins.configs.gitsigns"
        end
    }

    -- load luasnips + cmp related in insert mode only

    use {
        "rafamadriz/friendly-snippets",
        module = {"cmp", "cmp_nvim_lsp"},
        event = "InsertEnter"
    }

    use {
        "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        config = function()
            require "plugins.configs.cmp"
        end
    }

    use {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            require "plugins.configs.luasnip"
        end
    }
    use {
        "saadparwaiz1/cmp_luasnip",
        after = "LuaSnip"
    }
    use {
        "hrsh7th/cmp-nvim-lua",
        after = "cmp_luasnip"
    }
    use {
        "hrsh7th/cmp-nvim-lsp",
        after = "cmp-nvim-lua"
    }
    use {
        "hrsh7th/cmp-buffer",
        after = "cmp-nvim-lsp"
    }
    use {
        "hrsh7th/cmp-path",
        after = "cmp-buffer"
    }

    -- -- lsp stuff
    use {
        "williamboman/mason.nvim",
        requires = 'williamboman/mason-lspconfig.nvim',
        config = function()
            require "plugins.configs.mason"
        end
    }

    use {
        "neovim/nvim-lspconfig",
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open "nvim-lspconfig"
        end,
        requires = {
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require "plugins.configs.lspconfig"
        end
    }
    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
        config = function()
            require("plugins.configs.null-ls")
        end
    }

    -- -- file managing , picker etc
    use {
        "kyazdani42/nvim-tree.lua",
        ft = "alpha",
        cmd = {"NvimTreeToggle", "NvimTreeFocus"},
        config = function()
            require "plugins.configs.nvimtree"
        end
    }

    use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end
    }

    -- -- misc plugins
    use {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
            require "plugins.configs.autopairs"
        end
    }

    use {
        "numToStr/Comment.nvim",
        module = "Comment",
        keys = {"gc", "gb"}
    }

    use {
        "github/copilot.vim",
        branch = "release",
        config = function()
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_enabled = true
        end
    }

    use {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons"
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open "indent-blankline.nvim"
        end,
        config = function()
            require("plugins.configs.blankline")
        end
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        },
        config = function()
            require 'plugins.configs.lualine'
        end
    }
    use {
        "folke/tokyonight.nvim",
        config = function()
            require "plugins.configs.tokyonight"
        end
    }
    use {"ggandor/lightspeed.nvim"}
    use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        as = "lsp_lines",
        config = function()
            require("lsp_lines").setup()
            vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, {
                desc = "Toggle lsp_lines"
            })
            vim.diagnostic.config({
                virtual_text = false
            })
        end
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup()
      end
    }
    use {
      'akinsho/bufferline.nvim',
      tag = "v3.*",
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup{}
      end
    }
end

local present, packer = pcall(require, "packer")

if present then
    vim.cmd "packadd packer.nvim"

    -- load packer init options
    local init_options = {
        auto_clean = true,
        compile_on_sync = true,
        git = {
            clone_timeout = 6000
        },
        display = {
            working_sym = "ﲊ",
            error_sym = "✗ ",
            done_sym = " ",
            removed_sym = " ",
            moved_sym = "",
            open_fn = function()
                return require("packer.util").float {
                    border = "single"
                }
            end
        }
    }

    packer.init({})
    packer.startup {plugins}
end

