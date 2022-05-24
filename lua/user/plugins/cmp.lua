-- Setup nvim-cmp.
local cmp = require('cmp')
local lspconfig = require('lspconfig')
local luasnip = require('luasnip')

local sysname = vim.loop.os_uname().sysname
local homedir = vim.loop.os_homedir()
local pid = vim.fn.getpid()

local has_words_before = function()
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

cmp.setup({
    experimental = {
        ghost_text = true
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            elseif cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end

            -- if cmp.visible() then
            --   cmp.select_next_item()
            -- elseif luasnip.expand_or_jumpable() then
            --   luasnip.expand_or_jump()
            -- elseif has_words_before() then
            --   cmp.complete()
            -- else
            --   fallback()
            -- end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end

            -- if cmp.visible() then
            --   cmp.select_prev_item()
            -- elseif luasnip.jumpable(-1) then
            --   luasnip.jump(-1)
            -- else
            --   fallback()
            -- end
        end, { 'i', 's' }),

    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- npm install -g bash-language-server
lspconfig.bashls.setup { capabilities = capabilities }
--
--npm install -g typescript typescript-language-server
lspconfig.tsserver.setup { capabilities = capabilities }

-- npm install -g pyright
lspconfig.pyright.setup { capabilities = capabilities }

-- OmniSharp
-- https://github.com/OmniSharp/omnisharp-roslyn/releases
--
-- MacOS
-- Il faut autoriser l'exécutable sous MacOS
-- find ~/omnisharp | xargs xattr -r -d com.apple.quarantine
-- DOTNET_ROOT doit être défini dans ~/.zprofile
-- export DOTNET_ROOT=/usr/local/share/dotnet
if sysname == "Darwin" then
    local omnisharp_bin = homedir .. "/omnisharp/OmniSharp"
    lspconfig.omnisharp.setup {
        capabilities = capabilities,
        cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) }
    }
end

-- PowerShell
-- https://github.com/PowerShell/PowerShellEditorServices/releases
if sysname == "Darwin" then
    lspconfig.powershell_es.setup {
        capabilities = capabilities,
        bundle_path = homedir .. '/PowerShellEditorServices'
    }
end

-- lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.sumneko_lua.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- go
-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup {}

-- rust
-- brew install rust-analyzer
lspconfig.rust_analyzer.setup{}
