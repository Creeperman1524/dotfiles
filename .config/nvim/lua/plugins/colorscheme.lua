return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
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
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
