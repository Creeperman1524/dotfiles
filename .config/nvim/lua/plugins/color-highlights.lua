return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "foreground",

			---Set virtual symbol (requires render to be set to 'virtual')
			virtual_symbol = "●",
			virtual_symbol_position = "inline",

			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = false,
		})
	end,
}
