-- Highlight ao usar yank (seleção piscante XD)
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = 'Highlight ao copiar texto',
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})
