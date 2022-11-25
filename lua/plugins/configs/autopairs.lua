local present1, autopairs = pcall(require, "nvim-autopairs")
local present2, cmp = pcall(require, "cmp")

if not (present1 and present2) then
    return
end

local options = {
    fast_wrap = {},
    disable_filetype = {"TelescopePrompt", "vim"}
}

autopairs.setup(options)

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
