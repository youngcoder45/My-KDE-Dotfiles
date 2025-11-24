return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- comment this out if you dont prefer web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,

	vim.keymap.set("n", "f", function()
		local oil = require("oil")
		if oil.get_current_dir() then
			oil.close()
		else
			oil.open()
		end
	end, { desc = "Toggle Oil file explorer", silent = true }),
}
