local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

if(vim.fn.has('win32') > 0 or vim.fn.has('win32unix') > 0) then
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

require("toggleterm").setup({
   open_mapping = [[<C-t>]],
})
