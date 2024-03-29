-- Mason setup and config
local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    print("Something went wrong with mason")
    return
end

mason.setup()

local mason_lps_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lps_ok then
    print("Something went wrong with mason_lspconfig")
    return
end

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "yamlls", "pyright", "gopls", "bashls", "dockerls", "terraformls", "ansiblels", "nil_ls" },
})

-- Nvim lspconfig setup
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local servers = { 'pyright', 'gopls', 'bashls', 'dockerls', 'terraformls', 'lua_ls', 'ansiblels', 'nil_ls' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end
-- Retired servers
-- 'yamlls' 

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- if client.server_capabilities.documentSymbolProvider then
  --   navic.attach(client, bufnr)
  -- end
  --
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()print(vim.inspect(vim.lsp.buf_list_workspace_folders())) end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local nvim_lsp = require('lspconfig')

local lsp_flags = {
    debounce_text_changes = 150,
}

local servers = { 'pyright', 'gopls', 'bashls', 'dockerls', 'terraformls', 'ansiblels', 'yamlls'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

-- Set up luasnip
local luasnip = require 'luasnip'

local lspkind = require('lspkind')

-- Set up cmp
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    print("Something went wrong with cmp")
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<TAB>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-TAB>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    },
    -- formatting = {
    --     fields = { "abbr", "menu" },
    --     format = function(entry, vim_item)
    --         vim_item.menu = ({
    --             luasnip = "[Snippet]",
    --             buffer = "[Buffer]",
    --             path = "[Path]",
    --         })[entry.source.name]
    --         return vim_item
    --     end,
    -- },
    --
	formatting = {
	  format = lspkind.cmp_format({
	    mode = "symbol_text",
	    menu = ({
	      buffer = "[Buffer]",
	      nvim_lsp = "[LSP]",
	      luasnip = "[LuaSnip]",
	      nvim_lua = "[Lua]",
	      latex_symbols = "[Latex]",
	    })
	  }),
	},

    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'buffer'},
        { name = 'path'},
        --{ name = 'cmdline'},
    },
}

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})


-- DAP installation and settings
local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
    print("Something went wrong with dap")
    return
end

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
    print("Something went wrong with dapui")
    return
end

dapui.setup{

}

vim.keymap.set('n', '<Leader>du', function () require('dapui').toggle() end, { desc = "DAP ui toggle"})

require('dap-python').setup('~/.venv/pipx/bin/python3')


vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "DAP toggle breakpoint"})
vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end, { desc = "DAP continue"})
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "DAP run last"})

-- Autopairs setup
require('nvim-autopairs').setup{}


