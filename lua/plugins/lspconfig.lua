return {

    {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

    {
  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    {'williamboman/mason-lspconfig.nvim', lazy=false, opts = {ensure_installed = {"lua_ls", "clangd"}}},
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    { 'ms-jpq/coq.thirdparty', branch = "3p" },
  },
  init = function()
    vim.g.coq_settings = {
        auto_start = 'shut-up', -- if you want to start COQ at startup
    }
  end,
  config = function()
    -- Your LSP settings here
local lsp = require "lspconfig"
local coq = require "coq" -- add this

      lsp.tsserver.setup(coq.lsp_ensure_capabilities({capabilities = capabilities }))
      lsp.html.setup(coq.lsp_ensure_capabilities({capabilities = capabilities }))
     lsp.lua_ls.setup(coq.lsp_ensure_capabilities({capabilities = capabilities }))
     lsp.clangd.setup(coq.lsp_ensure_capabilities({capabilities = capabilities }))
    end,

},}
