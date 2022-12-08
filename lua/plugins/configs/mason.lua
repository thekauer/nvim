local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

mason.setup()

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

mason_lspconfig.setup {
  ensure_installed = {"rust_analyzer","tsserver","gopls","tailwindcss", "pyright","sumneko_lua"}

}

