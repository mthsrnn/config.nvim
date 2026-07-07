vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 250
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo//"
vim.opt.shortmess:append("c")
vim.opt.shada = "!,'100,<50,s10,h"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.g.mapleader = " "

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  severity_sort = true,
  update_in_insert = false,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "", },
})

vim.filetype.add({
  extension = {
    gotmpl = 'gotmpl',
    gowork = 'gowork',
  },
})
