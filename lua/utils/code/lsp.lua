local M = {}

M.servers = {
    lua_ls = {
      cmd = { "/usr/bin/lua-language-server" },
      root_markers = { ".git", "init.lua", ".luarc.json" },
      settings = { Lua = { runtime = { version = 'LuaJIT' }, diagnostics = { globals = { 'vim' } } } }
    },
    gopls = { cmd = { "/usr/bin/gopls" } },
    qmlls = { cmd = { "/lib64/qt6/bin/qmlls", "-E" } },
    clangd = { cmd = { "/usr/lib/llvm/21/bin/clangd" } },
    jdtls = {}
}

function M.setup_lspconfig(capabilities, servers)
    local lsp_status, _ = pcall(require, "lspconfig")
    if lsp_status then

      for server_name, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(server_name, config)
        vim.lsp.enable(server_name)
      end
    end
end

return M
