-- This file handles themes. You can comment and uncomment the theme you dont want to use or want to use respectively, also you can add your custom themes in similar format

return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 2000,
	lazy = false,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- you can also change it to following: "latte", "frappe", "macchiato", or "mocha" if you would like a different style
			transparent_background = false, -- set this to true for transparency
			term_colors = true,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = { "bold" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = false,
				neotree = true,
				telescope = true,
				which_key = true,
				notify = true,
				mini = true,
				treesitter = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")

		-- Highlight group for telescope
		local cp = require("catppuccin.palettes").get_palette("mocha")

		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = cp.surface2, bg = cp.surface0 })
		vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = cp.text, bg = cp.surface0 })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = cp.lavender, bg = cp.surface1 })
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = cp.pink, bg = cp.surface1 })
		vim.api.nvim_set_hl(0, "TelescopeMultiSelection", { fg = cp.text, bg = cp.surface2 })

		vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = cp.crust, bg = cp.mauve })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = cp.crust, bg = cp.sky })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = cp.crust, bg = cp.lavender })
		vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = cp.text, bg = cp.surface1 })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = cp.surface1, bg = cp.surface1 })

		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
	end,
}

--[[
return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 2000,   -- To make this plugin load before every other plugin
  lazy = false,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",

      highlight_groups = {

        -- Highlight group for neotree --

        -- Pink file names
            NeoTreeFileName = { fg = "love" },
            NeoTreeFileIcon = { fg = "love" },
        -- Lavender for directories (creates a soft gradient feel)
            NeoTreeDirectoryName = { fg = "iris" },
            NeoTreeDirectoryIcon = { fg = "iris" },
        -- Softer background for tree
            NeoTreeNormal = { fg = "love", bg = "base" },
            NeoTreeNormalNC = { fg = "love", bg = "base" },
        -- Gradient separator
            NeoTreeWinSeparator = { fg = "highlight_med", bg = "none" },
        -- Optional: Adjust symbols and git status colors
            NeoTreeGitUntracked = { fg = "iris" },
            NeoTreeGitModified = { fg = "love" },
            NeoTreeGitAdded = { fg = "foam" },
            NeoTreeGitDeleted = { fg = "love" },

        -- Highlight group for telescope --

            TelescopeBorder = { fg = "overlay", bg = "overlay" },
            TelescopeNormal = { fg = "subtle", bg = "overlay" },
            TelescopeSelection = { fg = "text", bg = "highlight_med" },
            TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
            TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

            TelescopeTitle = { fg = "base", bg = "love" },
            TelescopePromptTitle = { fg = "base", bg = "pine" },
            TelescopePreviewTitle = { fg = "base", bg = "iris" },
            TelescopePromptNormal = { fg = "text", bg = "surface" },
            TelescopePromptBorder = { fg = "surface", bg = "surface" },
      }

    })
    vim.cmd("colorscheme rose-pine")
  end,
}
]]

--[[
return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  priority = 2000,
  lazy = false,
  config = function()
    require("tokyonight").setup({
      style = "moon", -- other choices are: "storm", "night", or "day" if you would like another style of this theme
      transparent = false, -- set this to true if you want transparency
      styles = {
        sidebars = "dark", -- turn this to false if you want light sidebars
        floats = "dark",   -- turn this to false if you want light floats
      },

      -- Highlight group overrides --

      on_highlights = function(hl, c)
        -- Highlight group for neotree --

        -- Soft cyan-blue file names
        hl.NeoTreeFileName = { fg = c.blue }
        hl.NeoTreeFileIcon = { fg = c.blue }

        -- Lavender for directories
        hl.NeoTreeDirectoryName = { fg = c.magenta }
        hl.NeoTreeDirectoryIcon = { fg = c.magenta }

        -- Slightly darker background for tree
        hl.NeoTreeNormal = { fg = c.fg, bg = c.bg_dark }
        hl.NeoTreeNormalNC = { fg = c.fg, bg = c.bg_dark }

        -- Dim border separation
        hl.NeoTreeWinSeparator = { fg = c.border_highlight, bg = "none" }

        -- Optional: Git status colors
        hl.NeoTreeGitUntracked = { fg = c.magenta }
        hl.NeoTreeGitModified = { fg = c.orange }
        hl.NeoTreeGitAdded = { fg = c.green }
        hl.NeoTreeGitDeleted = { fg = c.red }

        -- Highlight group for telescope --

        hl.TelescopeBorder = { fg = c.border_highlight, bg = c.bg_dark }
        hl.TelescopeNormal = { fg = c.fg_dark, bg = c.bg_dark }
        hl.TelescopeSelection = { fg = c.fg, bg = c.bg_highlight }
        hl.TelescopeSelectionCaret = { fg = c.blue, bg = c.bg_highlight }
        hl.TelescopeMultiSelection = { fg = c.fg, bg = c.bg_visual }

        hl.TelescopeTitle = { fg = c.bg, bg = c.blue }
        hl.TelescopePromptTitle = { fg = c.bg, bg = c.magenta }
        hl.TelescopePreviewTitle = { fg = c.bg, bg = c.cyan }
        hl.TelescopePromptNormal = { fg = c.fg, bg = c.bg_dark }
        hl.TelescopePromptBorder = { fg = c.bg_dark, bg = c.bg_dark }
      end,
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
]]
