return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			term_colors = true,
			styles = {
				functions = { "italic" },
				keywords = { "bold" },
				comments = { "italic" },
			},
			integrations = {
				alpha = true,
				gitsigns = true,
				notify = true,
				noice = true,
				mason = true,
				telescope = {
					enabled = true,
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
