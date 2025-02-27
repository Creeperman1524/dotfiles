return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				border = "rounded",
			},
		})

		-- Language Server Protocols
		-- Enables error checking (messages on the side)
		-- Can be further configured in lsp/lspconfig.lua
		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"html", -- html
				"emmet_ls", -- html emmet support

				"cssls", -- css
				"tailwindcss", -- tailwind (css framework)

				"ts_ls", -- javascript/typescript
				"svelte", -- svelte (website framework)

				"lua_ls", -- lua

				"pyright", -- python

				"clangd", -- c/c++

				-- "java-language-server", -- java

				"bashls", -- bash
			},
		})

		-- Formatter and Linters
		-- Formatters can be further configured in formatting.lua
		-- Linters can be further configured in linting.lua
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter (general formatter)

				"stylua", -- lua formatter

				"isort", -- python formatter
				"black", -- python formatter
				"mypy", -- python linter
				"debugpy", -- python debugger

				"eslint_d", -- javascript/typescript linter

				"clang-format", -- c/c++, java formatter
				"codelldb", -- c/c++ debugger

				"beautysh", -- bash formatter
				"shellcheck", -- bash linter
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>ma", "<cmd>:Mason<cr>", { desc = "Open the Mason.nvim GUI" })
	end,
}
