return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			term_colors = true,
			transparent_background = true,
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
					style = "nvchad",
				},
			},
			color_overrides = {
				mocha = {
					base = "#000000",
					crust = "#000000",
					mantle = "#000000",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
