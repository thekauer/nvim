vim.defer_fn(function()
    pcall(require, "impatient")
end, 0)

require "core"
require "core.options"
require "core.mappings"

-- setup packer + plugins
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  require "plugins"
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- install binaries from mason.nvim & tsparsers
--    vim.api.nvim_create_autocmd("User", {
--        pattern = "PackerComplete",
--        callback = function()
--            vim.cmd "bw | silent! MasonInstallAll" -- close packer window
--            require("packer").loader "nvim-treesitter"
--        end
--    })

