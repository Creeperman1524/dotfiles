local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.lsp" },
		{ import = "plugins.dap" },
	},
	change_detection = {
		notify = false,
	},
	checker = {
		enabled = true,
		notify = false,
	},
	ui = {
		border = "rounded",
	},
	rocks = {
		enabled = false,
	},
})

local keymap = vim.keymap
keymap.set("n", "<leader>la", "<cmd>Lazy<cr>", { desc = "Open the Lazy.nvim GUI" })

-- Enable highlighting for nvim-treesitter
-- From https://www.reddit.com/r/neovim/comments/1oxgrnx/enabling_treesitter_highlighting_if_its_installed/
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),

	callback = function(args)
		local lang = vim.treesitter.language.get_lang(args.match)
		if not lang or not vim.treesitter.language.add(lang) then
			-- Automaticall install languages that we don't have (should add to the "install" in the treesitter.lua file)
			if require("nvim-treesitter.parsers")[lang] ~= nil and not vim.treesitter.get_parser() then
				pcall(function()
					require("nvim-treesitter").install(lang)
				end)
			end
		end

		-- Setup for hightlights
		if vim.treesitter.query.get(lang, "highlights") then
			vim.treesitter.start(args.buf)
		end

		-- Setup for indents (experimental)
		if vim.treesitter.query.get(lang, "indents") then
			vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
		end
	end,
})
