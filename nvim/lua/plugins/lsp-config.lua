return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind CSS
					"emmet_ls", -- Emmet for fast HTML/CSS
					"ts_ls", -- JavaScript & TypeScript
					"yamlls", -- YAML
					"bashls", -- Bash/Shell scripts
					"lua_ls", -- Lua
					"pyright", -- Python
					"clangd", -- C, C++
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- Modern LSP setup using vim.lsp.config (Neovim 0.11+)
			-- Check if vim.lsp.config exists (Neovim 0.11+)
			if vim.lsp.config then
				-- Use the new vim.lsp.config API
				vim.lsp.config.html = { capabilities = capabilities }
				vim.lsp.config.cssls = { capabilities = capabilities }
				vim.lsp.config.tailwindcss = { capabilities = capabilities }
				vim.lsp.config.emmet_ls = { capabilities = capabilities }
				vim.lsp.config.ts_ls = { capabilities = capabilities }
				vim.lsp.config.yamlls = { capabilities = capabilities }
				vim.lsp.config.bashls = { capabilities = capabilities }
				vim.lsp.config.lua_ls = {
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) }
						}
					}
				}
				vim.lsp.config.pyright = { capabilities = capabilities }
				vim.lsp.config.clangd = { capabilities = capabilities }
			else
				-- Fallback to traditional lspconfig for older Neovim versions
				local lspconfig = require("lspconfig")
				local servers = {
					html = { capabilities = capabilities },
					cssls = { capabilities = capabilities },
					tailwindcss = { capabilities = capabilities },
					emmet_ls = { capabilities = capabilities },
					ts_ls = { capabilities = capabilities },
					yamlls = { capabilities = capabilities },
					bashls = { capabilities = capabilities },
					lua_ls = { 
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = { globals = { "vim" } },
								workspace = { library = vim.api.nvim_get_runtime_file("", true) }
							}
						}
					},
					pyright = { capabilities = capabilities },
					clangd = { capabilities = capabilities },
				}
				
				for server, config in pairs(servers) do
					lspconfig[server].setup(config)
				end
			end

			-- Enhanced key mappings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Show references" })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format document" })

			-- Enhanced diagnostics configuration
			vim.diagnostic.config({
				update_in_insert = false,
				virtual_text = {
					severity = { min = vim.diagnostic.severity.WARN },
					prefix = "●",
					spacing = 2,
				},
				signs = {
					severity = { min = vim.diagnostic.severity.WARN },
				},
				underline = true,
				float = { 
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Diagnostic keymaps
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

			-- Auto-show diagnostics on cursor hold
			vim.o.updatetime = 250
			vim.api.nvim_create_autocmd("CursorHold", {
				callback = function()
					vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
				end,
			})

			-- LSP attach autocommand for buffer-specific setup
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					
					-- Highlight symbol under cursor
					if client and client.supports_method("textDocument/documentHighlight") then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})
		end,
	},
}
