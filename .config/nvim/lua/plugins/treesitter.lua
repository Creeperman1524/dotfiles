return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate", -- all language parsers are updated when loaded
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter")
		local autotag = require("nvim-ts-autotag")

		autotag.setup({
			opts = {
				enable_close_on_slash = true,
			},
		})

		-- install treesitter languages
		treesitter.install({
			"bash",
			"cpp",
			"css",
			"dockerfile",
			"gitignore",
			"html",
			"java",
			"javascript",
			"json",
			"lua",
			"markdown",
			"markdown_inline",
			"nix",
			"python",
			"regex",
			"svelte",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		})

		-- Note: Highlighting and other functionality is setup in core/lazy.lua, as it should be initialized by vim rather than lazy
	end,
}
