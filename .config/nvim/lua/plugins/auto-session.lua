return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>wr", "<cmd>SessionRestore<CR>", mode = "n", desc = "Restore session for cwd" }, -- restore last workspace session for current directory
		{ "<leader>ws", "<cmd>SessionSave<CR>", mode = "n", desc = "Save session for auto session root dir" }, -- save workspace session for current working directory
	},
	opts = {
		auto_restore = true,
		auto_save = true,
		bypass_save_filetypes = { "alpha" },
		suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/", "~/dev" },

		pre_save_cmds = {
			function()
				require("dapui").close()
			end,
		},
	},
	config = function(_, opts)
		require("auto-session").setup(opts)
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions"
	end,
}
