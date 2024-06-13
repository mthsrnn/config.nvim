vim.g.mapleader = " "

-- the following commands have been taken from primeagens's config
-- and documented according to his own video.

-- opens explorer on current path
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlited content up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeps cursor in first character while appending to the line above
vim.keymap.set("n", "J", "mzJ`z")

-- keeps cursor centered while doing half-based jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- also centers search navigation
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- pastes over highlighted content without replacing the paste buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy stuff to the system clipboard (the "+y/+Y" buffers)
-- primagen attributes this to "asbjornHaland"
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- deleting withoud appending to the copy buffer
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- I actually don't have anything against ctrl-c, it feels faster to reach
-- compared to esc or crtl+[
vim.keymap.set("i", "<C-c>", "<Esc>")

-- apparently Q mode is not a good place to be
vim.keymap.set("n", "Q", "<nop>")

-- replaces the current word on cursor on the entire buffer
-- very clever!
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

