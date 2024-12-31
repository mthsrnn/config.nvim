local opt = vim.opt

-- colorscheme stuff
opt.termguicolors = true
vim.cmd.colorscheme 'srcery'

-- highlight yanked text (from kickstart)
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

opt.cursorline = true
opt.relativenumber = true
opt.nu = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.colorcolumn = "80"
opt.updatetime = 50
