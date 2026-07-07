if vim.loader then
  vim.loader.enable()
end

--  ███▄ ▄███▓▄▄▄█████▓ ██░ ██   ██████  ██▀███   ███▄    █  ███▄    █
-- ▓██▒▀█▀ ██▒▓  ██▒ ▓▒▓██░ ██▒▒██    ▒ ▓██ ▒ ██▒ ██ ▀█   █  ██ ▀█   █
-- ▓██    ▓██░▒ ▓██░ ▒░▒██▀▀██░░ ▓██▄   ▓██ ░▄█ ▒▓██  ▀█ ██▒▓██  ▀█ ██▒
-- ▒██    ▒██ ░ ▓██▓ ░ ░▓█ ░██   ▒   ██▒▒██▀▀█▄  ▓██▒  ▐▌██▒▓██▒  ▐▌██▒
-- ▒██▒   ░██▒  ▒██▒ ░ ░▓█▒░██▓▒██████▒▒░██▓ ▒██▒▒██░   ▓██░▒██░   ▓██░
-- ░ ▒░   ░  ░  ▒ ░░    ▒ ░░▒░▒▒ ▒▓▒ ▒ ░░ ▒▓ ░▒▓░░ ▒░   ▒ ▒ ░ ▒░   ▒ ▒
-- ░  ░      ░    ░     ▒ ░▒░ ░░ ░▒  ░ ░  ░▒ ░ ▒░░ ░░   ░ ▒░░ ░░   ░ ▒░
-- ░      ░     ░       ░  ░░ ░░  ░  ░    ░░   ░    ░   ░ ░    ░   ░ ░
--        ░             ░  ░  ░      ░     ░              ░          ░
--
-- RULES:
-- 1) everything that runs outside of init.lua must be obvious
-- 2) one-shot configs must be part of core and called immediately

require("core.options")
require("core.keymap")
require("core.autocmd")

local plugins = require("utils.pack.plugin")
local src = require("utils.pack.source")
local lsp = require("utils.code.lsp")
local completions = require("utils.code.completions")

vim.pack.add({
  src.gh("neovim/nvim-lspconfig"),
  src.gh("nvim-treesitter/nvim-treesitter"),
  src.gh("ms-jpq/chadtree"),
  src.gh("catgoose/nvim-colorizer.lua"),
  src.gh("rktjmp/lush.nvim"),
  src.gh("rktjmp/shipwright.nvim"),
  src.gh("nvim-mini/mini.nvim"),
  src.lo("unsigned"),
  src.gh("rafamadriz/friendly-snippets"),
  src.gh("akinsho/toggleterm.nvim"),
  src.gh("Saghen/blink.cmp", { version = vim.version.range('>=1.10.0') }),
  --src.gh("nvim-java/nvim-java"),
  src.gh("omerfdmrl/nvim-java", { version = "fix/jdtls-download-url"}), --because the default repo is broken
      src.gh("JavaHello/spring-boot.nvim", { version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0"}),
      src.gh("MunifTanjim/nui.nvim"),
      src.gh("mfussenegger/nvim-dap"),
})

plugins.clean_inactive_packages()

vim.cmd.colorscheme("unsigned")

local move_config = {
  mappings = {
    left       = '<A-h>',
    right      = '<A-l>',
    down       = '<A-j>',
    up         = '<A-k>',
    line_left  = '<A-h>',
    line_right = '<A-l>',
    line_down  = '<A-j>',
    line_up    = '<A-k>',
  },
  options = { reindent_linewise = true }
}

local toggleterm_config = {
  open_mapping = [[<c-/>]]
}

local blink_config = {
  keymap = { preset = 'default' },
  appearance = { nerd_font_variant = 'mono' },
  completion = { documentation = { auto_show = false } },
  sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  fuzzy = { implementation = "prefer_rust_with_warning" }
}

local java_config = {
    jdtls = { version = '1.54.0' },

}

plugins.require_plugin_list({
  { "mini.move",     move_config },
  { "mini.pairs",    {} },
  { "mini.tabline",  {} },
  { "colorizer",     {} },
  { "toggleterm",    toggleterm_config },
  { "blink.cmp",     blink_config },
  { "java",          java_config },
})

completions.blink_setup()
lsp.setup_lspconfig(completions.capabilities,  lsp.servers)
