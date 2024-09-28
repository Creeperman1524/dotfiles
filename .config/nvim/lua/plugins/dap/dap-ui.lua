return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("nvim-dap-virtual-text").setup({
			all_references = true,
			virt_text_pos = "eol",
		})
		dapui.setup()

		-- Opens the debuffer on attach
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		-- Opens the debugger on launch
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		-- Closes the GUI when dap is terminated
		-- dap.listeners.before.event_terminated["dapui_config"] = function()
		-- 	dapui.close()
		-- end

		-- Closes the GUI when the program finishes executing
		-- dap.listeners.before.event_exited["dapui_config"] = function()
		-- 	dapui.close()
		-- end

		local keymap = vim.keymap
		keymap.set("n", "<leader>dx", function()
			dapui.close()
		end, { desc = "Closes the DAP UI" })
		keymap.set("n", "<leader>do", function()
			dapui.open()
		end, { desc = "Opens the DAP UI" })

		keymap.set("n", "<F5>", function()
			require("dap").continue()
		end, { desc = "Start/Continue the Debugger" })
		keymap.set("n", "<F10>", function()
			require("dap").step_over()
		end, { desc = "Step over" })
		keymap.set("n", "<F11>", function()
			require("dap").step_into()
		end, { desc = "Step into" })
		keymap.set("n", "<F12>", function()
			require("dap").step_out()
		end, { desc = "Step out" })

		keymap.set("n", "<Leader>b", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Tobble breakpoint" })
		keymap.set("n", "<Leader>B", function()
			require("dap").set_breakpoint()
		end, { desc = "Set breakpoint" })
		keymap.set("n", "<Leader>lp", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "Set breakpoint with log" })

		keymap.set("n", "<Leader>dl", function()
			require("dap").run_last()
		end, { desc = "Run last dap process" })
	end,
}
