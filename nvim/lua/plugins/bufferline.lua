---@diagnostic disable: undefined-global
return {
	"akinsho/bufferline.nvim",
	event = "UIEnter",
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
		{ "<leader>cd", "<Cmd>bdelete<CR>", desc = "Close Current Buffer" },

		-- key-binds to switch between buffers/tabs
		{ "b1", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 1" },
		{ "b2", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 2" },
		{ "b3", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 3" },
		{ "b4", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 4" },
		{ "b5", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 5" },
		{ "b6", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 6" },
		{ "b7", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 7" },
		{ "b8", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 8" },
		{ "b9", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 9" },
		{ "b0", "<Cmd>BufferLineGoToBuffer -1<CR>", desc = "Go to last buffer" },
	},

	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diag)
				diag = diag or {}
				local parts = {}
				if diag.error and diag.error > 0 then
					table.insert(parts, " " .. tostring(diag.error))
				end
				if diag.warning and diag.warning > 0 then
					table.insert(parts, " " .. tostring(diag.warning))
				end
				if diag.info and diag.info > 0 then
					table.insert(parts, " " .. tostring(diag.info))
				end
				if diag.hint and diag.hint > 0 then
					table.insert(parts, " " .. tostring(diag.hint))
				end
				return #parts > 0 and table.concat(parts, " ") or ""
			end,

            -- aesthetics
			separator_style = "thick",
			get_element_icon = function(opts)
				opts = opts or {}
				local ok, devicons = pcall(require, "nvim-web-devicons")
				if ok and devicons and type(devicons.get_icon) == "function" then
					local icon = devicons.get_icon(opts.filetype or opts.name or "", nil, { default = true })
					if icon then
						return icon, "BufferlineAccent"
					end
				end
				return "", "BufferlineAccent"
			end,

			tab_size = 26,
			max_name_length = 30,
			tab_padding = 6,

			show_buffer_close_icons = false,
			show_close_icon = false,
			always_show_bufferline = true,

			custom_areas = {}, -- you can add gaps using this if u want
		},
	},

	config = function(_, opts)
		pcall(function()
			vim.diagnostic.config({ update_in_insert = true })
		end)

		-- Link BufferlineAccent to a standard highlight so it follows the active colorscheme.
		-- 'Title' is a good general-purpose accent; change to 'Identifier' or 'Constant' if you prefer.
		local ok_link, _ = pcall(vim.cmd, 'highlight link BufferlineAccent Title')
		if not ok_link then
			pcall(vim.api.nvim_set_hl, 0, "BufferlineAccent", { fg = "#ff66b2", bold = true })
		end

		local ok, bufferline = pcall(require, "bufferline")
		if not ok or not bufferline then
			return
		end
		pcall(bufferline.setup, opts or {})

	end,
}

