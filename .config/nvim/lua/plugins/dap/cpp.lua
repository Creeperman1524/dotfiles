return {
	"julianolf/nvim-dap-lldb",
	ft = "cpp",
	dependencies = { "mfussenegger/nvim-dap" },
	opts = { codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb" },
}
