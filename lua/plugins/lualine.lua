return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				theme = "srcery",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
		})
	end,
}
