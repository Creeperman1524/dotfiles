return {
	"julianolf/nvim-dap-lldb",
	ft = "c, cpp",
	dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
	opts = { codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb" },
}
