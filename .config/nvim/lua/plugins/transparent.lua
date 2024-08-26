return {
	"xiyaowong/transparent.nvim",
	priority = 999,
	opts = {
		extra_groups = {
			"NotifyBackground",
		},
	},
	config = function()
		local transparent = require("transparent")
		transparent.clear_prefix("lualine")
		transparent.clear_prefix("BufferLine")
		transparent.clear_prefix("NvimTree")

		local keymap = vim.keymap
		keymap.set("n", "<leader>tt", "<cmd>:TransparentToggle<cr>", { desc = "Toggle the background transparency" })
	end,
}
