return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "┊" },
		scope = { -- do not underline the current scope the cursor is in
			enabled = true,
			show_start = false,
			show_end = false,
		},
	},
}
