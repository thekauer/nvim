local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
    return
end

vim.lsp.set_log_level("debug")

local augroup_format = vim.api.nvim_create_augroup("Format", {
    clear = true
})
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({
        group = augroup_format,
        buffer = bufnr
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({
                bufnr = bufnr
            })
        end
    })
end

local on_attach = function(client, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, {
            buffer = bufnr,
            desc = desc
        })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gr', require('telescope.builtin').lsp_references)
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, {
        desc = 'Format current buffer with LSP'
    })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                globals = {'vim'}
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
}

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
    root_dir = function()
        return vim.loop.cwd()
    end,
    cmd = {"typescript-language-server", "--stdio"},
    capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 4,
        prefix = "●"
    },
    severity_sort = true
})

-- n = {
--     ["gD"] = {function()
--         vim.lsp.buf.declaration()
--     end, "lsp declaration"},

--     ["gd"] = {function()
--         vim.lsp.buf.definition()
--     end, "lsp definition"},

--     ["K"] = {function()
--         vim.lsp.buf.hover()
--     end, "lsp hover"},

--     ["gi"] = {function()
--         vim.lsp.buf.implementation()
--     end, "lsp implementation"},

--     ["<leader>ls"] = {function()
--         vim.lsp.buf.signature_help()
--     end, "lsp signature_help"},

--     ["<leader>D"] = {function()
--         vim.lsp.buf.type_definition()
--     end, "lsp definition type"},
--     ["<leader>ca"] = {function()
--         vim.lsp.buf.code_action()
--     end, "lsp code_action"},

--     ["gr"] = {function()
--         vim.lsp.buf.references()
--     end, "lsp references"},

--     ["<leader>f"] = {function()
--         vim.diagnostic.open_float()
--     end, "floating diagnostic"},

--     ["[d"] = {function()
--         vim.diagnostic.goto_prev()
--     end, "goto prev"},

--     ["d]"] = {function()
--         vim.diagnostic.goto_next()
--     end, "goto_next"},

--     ["<leader>q"] = {function()
--         vim.diagnostic.setloclist()
--     end, "diagnostic setloclist"},

--     ["<leader>fm"] = {function()
--         vim.lsp.buf.format {
--             async = true
--         }
--     end, "lsp formatting"},

--     ["<leader>wa"] = {function()
--         vim.lsp.buf.add_workspace_folder()
--     end, "add workspace folder"},

--     ["<leader>wr"] = {function()
--         vim.lsp.buf.remove_workspace_folder()
--     end, "remove workspace folder"},

--     ["<leader>wl"] = {function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, "list workspace folders"}
-- }

vim.keymap.set('n', 'gD', function()
    vim.lsp.buf.declaration()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', 'gd', function()
    vim.lsp.buf.definition()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', 'gi', function()
    vim.lsp.buf.implementation()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>ls', function()
    vim.lsp.buf.signature_help()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>D', function()
    vim.lsp.buf.type_definition()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>ca', function()
    vim.lsp.buf.code_action()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', 'gr', function()
    vim.lsp.buf.references()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>f', function()
    vim.diagnostic.open_float()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '[d', function()
    vim.diagnostic.goto_prev()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', 'd]', function()
    vim.diagnostic.goto_next()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>q', function()
    vim.diagnostic.setloclist()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>fm', function()
    vim.lsp.buf.format {
        async = true
    }
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>wa', function()
    vim.lsp.buf.add_workspace_folder()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>wr', function()
    vim.lsp.buf.remove_workspace_folder()
end, {
    silent = true,
    noremap = true
})

vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, {
    silent = true,
    noremap = true
})
