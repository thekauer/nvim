return {
  {
    "hrsh7th/nvim-cmp",
    after = "lspkind-nvim",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" } }))
      opts.formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          -- menu = ({
          --   buffer = "[Buffer]",
          --   nvim_lsp = "[LSP]",
          --   luasnip = "[LuaSnip]",
          --   nvim_lua = "[Lua]",
          --   latex_symbols = "[Latex]",
          -- })
        }),
      }
    end,
  },
}
