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
  src.gh("nyoom-engineering/oxocarbon.nvim"),
  src.gh("neovim/nvim-lspconfig"),
  src.gh("nvim-treesitter/nvim-treesitter"),
  src.gh("ms-jpq/chadtree"),
  src.gh("catgoose/nvim-colorizer.lua"),
  src.gh("rktjmp/lush.nvim"),
  src.gh("rktjmp/shipwright.nvim"),
  src.gh("nvim-mini/mini.nvim"),
  src.gh("rafamadriz/friendly-snippets"),
  src.gh("akinsho/toggleterm.nvim"),
  src.gh("Saghen/blink.cmp", { version = vim.version.range('>=1.10.0') }),
  src.gh("nvim-java/nvim-java"),
      src.gh("JavaHello/spring-boot.nvim", { version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0"}),
      src.gh("MunifTanjim/nui.nvim"),
      src.gh("mfussenegger/nvim-dap"),
})

plugins.clean_inactive_packages()

vim.cmd.colorscheme "oxocarbon"

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

local statusline_active_content = function()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git           = MiniStatusline.section_git({ trunc_width = 40 })
  local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
  local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
  local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
  local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
  local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
  local location      = MiniStatusline.section_location({ trunc_width = 75 })
  local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

  return MiniStatusline.combine_groups({
    { hl = mode_hl,                  strings = { mode } },
    { hl = 'MiniStatuslineDevinfo',  strings = { git} },
    '%<',
    { hl = 'MiniStatuslineFilename', strings = { filename } },
    '%=',
    { hl = 'MiniStatuslineFileinfo', strings = { fileinfo, diagnostics, lsp } },
    { hl = mode_hl,                  strings = { search, location } },
  })
end

local statusline_inactive_content = function()
  local filename      = MiniStatusline.section_filename({ trunc_width = 140 })

  return MiniStatusline.combine_groups({
    '%<',
    { hl = 'MiniStatuslineFilename', strings = { filename } },
    '%=',
  })
end

local statusline_config = {
  content = {
    active = statusline_active_content,
    inactive = statusline_inactive_content,
  },

  use_icons = true,
}

plugins.require_plugin_list({
  { "mini.move",        move_config },
  { "mini.pairs",       {} },
  { "mini.tabline",     {} },
  { "mini.icons",       {} },
  { "mini.git",         {} },
  { "mini.diff",        {} },
  { "mini.statusline",  statusline_config },
  { "colorizer",        {} },
  { "toggleterm",       toggleterm_config },
  { "blink.cmp",        blink_config },
  { "java",             java_config },
})

completions.blink_setup()
lsp.setup_lspconfig(completions.capabilities,  lsp.servers)
