return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.astyle.with({
                    extra_args = {'-A14', '-t', '-xV', '-U', '-D', '-f', '-xo', '--squeeze-lines=2', '--max-code-length=200', '--mode=c'}
                }),
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
			},
		})

		vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})
	end,
}
