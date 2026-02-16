return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "modern",
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>d", group = "debugger" },
			{ "<leader>e", group = "file explorer" },
			{ "<leader>f", group = "telescope" },
			{ "<leader>h", group = "git" },
			{ "<leader>s", group = "windows" },
			{ "<leader>t", group = "tabs" },
			{ "<leader>w", group = "workspace" },
			{ "<leader>x", group = "trouble" },
		})
	end,
}
