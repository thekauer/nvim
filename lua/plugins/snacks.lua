local is_git_item = function(item, git_nodes)
  return vim.iter(git_nodes):any(function(node)
    if node.dir_status then
      return vim.fs.relpath(node.path, item.file) ~= nil
    end
    return vim.fs.relpath(item.file, node.path) ~= nil
  end)
end

return {
  "snacks.nvim",
  keys = {
    {
      "<leader>gmp",
      function()
        Snacks.picker.gh_pr({ author = "andras-kauer_data" })
      end,
      desc = "My PRs",
    },
    {
      "<leader>GP",
      function()
        local pr_number = vim.fn.system("gh pr view --json number -q .number"):gsub("%s+", "")
        if vim.v.shell_error ~= 0 then
          vim.notify("No PR found for current branch", vim.log.levels.WARN)
          return
        end
        local repo = vim.fn.system("gh repo view --json nameWithOwner -q .nameWithOwner"):gsub("%s+", "")
        vim.cmd("edit gh://" .. repo .. "/pr/" .. pr_number)
      end,
      desc = "Current PR",
    },
  },
  opts = {
    scroll = { enabled = false },
    picker = {
      sources = {
        files = { hidden = true },
        explorer = {
          finder = function(opts, ctx)
            local Tree = require("snacks.explorer.tree")
            local git_nodes = {}
            Tree:walk(Tree:find(ctx.picker:cwd()), function(node)
              if node.status then
                table.insert(git_nodes, node)
              end
            end)
            ctx.picker.git_nodes = git_nodes
            return require("snacks.picker.source.explorer").explorer(opts, ctx)
          end,
          -- Config
          transform = function(item, ctx)
            if ctx.picker.opts.only_git then
              return is_git_item(item, ctx.picker.git_nodes)
            end
          end,
          only_git = false,
          toggles = {
            only_git = "S",
          },
          win = {
            list = {
              keys = {
                ["S"] = "toggle_only_git",
              },
            },
          },
        },
      },
    },
  },
}
