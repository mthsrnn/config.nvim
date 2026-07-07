-- Keymaps genéricos
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Salvar arquivo' })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Sair do Neovim' })
vim.keymap.set('n', '<leader>cf', '<cmd>edit $MYVIMRC<cr>', { desc = 'Abrir init.lua' })
vim.keymap.set('n', '<leader>o', '<cmd>source $MYVIMRC<cr>', { desc = 'Source do arquivo no buffer atual' })
vim.keymap.set('n', '<leader>-', '<cmd>CHADopen<cr>', {noremap = true, desc = "Explorar arquivos (chadtree)" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Ver erro flutuante" })
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true, desc = "Copiar para o clipboard do sistema" })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Limpa destaque da busca' })

-- Navegar entre janelas
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Mover para a janela da esquerda' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Mover para a janela de baixo' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Mover para a janela de cima' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Mover para a janela da direita' })

-- Navegar entre buffers
vim.keymap.set('n', 'H', '<cmd>bprevious<CR>', { desc = 'Buffer anterior' })
vim.keymap.set('n', 'L', '<cmd>bnext<CR>', { desc = 'Próximo buffer' })

-- Navegar em busca
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Não mudar o registrador de cópia depois de paste sobre seleção
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Colar por cima sem substituir o registrador" })
