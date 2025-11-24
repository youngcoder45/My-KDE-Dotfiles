return {
	"mfussenegger/nvim-dap",
	dependencies = { "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui" },

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

--    to install debug adapters for individual programming languages visit https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "DAP: continue" })

		-- a few more keybinds
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end, { desc = "DAP: step over" })
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end, { desc = "DAP: step into" })
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end, { desc = "DAP: step out" })
		vim.keymap.set("n", "<Leader>lp", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "DAP: logpoint" })
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end, { desc = "DAP: open repl" })
		vim.keymap.set("n", "<Leader>dl", function()
			dap.run_last()
		end, { desc = "DAP: run last" })
	end,
}
