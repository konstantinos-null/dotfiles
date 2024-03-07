local status_ok, mason = pcall(require, "mason")
if not status_ok then
    print("Something went wrong with mason")
    return
end

mason.setup()

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    print("Something went wrong with mason_lspconfig")
    return
end

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "yamlls", "pyright", "gopls", "bashls", "dockerls", "terraformls", "ansiblels", "nil_ls" },
})
