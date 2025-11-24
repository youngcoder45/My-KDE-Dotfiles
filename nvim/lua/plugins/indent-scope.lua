return {
	"echasnovski/mini.indentscope",
	version = false, -- always use latest
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		symbol = "│",
		options = { try_as_border = true },
	},
	config = function(_, opts)
		local indentscope = require("mini.indentscope")
		indentscope.setup(opts)

		-- make indent line color match the current theme
		local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
		vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = normal_hl.fg })

		-- reapply color when colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
				vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = normal_hl.fg })
			end,
		})

		-- disable animation in certain filetypes (optional)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "help", "dashboard", "neo-tree", "Trouble", "lazy" },
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
