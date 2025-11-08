return {
	-- === LSP CONFIG (Modern, 0.11+ Safe) ===
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{
				"glepnir/lspsaga.nvim",
				branch = "main",
				config = function()
					require("lspsaga").setup({})
				end,
			},
		},
		opts = {
			servers = {
				tsserver = {}, -- TypeScript
				omnisharp = {
					cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
				}, -- C#
				-- Add more if needed
			},
			on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				-- Navigation
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

				-- Workspace
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)

				-- Refactor
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

				-- Diagnostics
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

				-- Formatting
				if client.server_capabilities.documentFormattingProvider then
					vim.keymap.set("n", "<leader>fm", function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end, { buffer = bufnr, desc = "Format document" })

					-- Auto-format on save
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = false })
						end,
					})
				end
			end,
			capabilities = function()
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				return require("cmp_nvim_lsp").default_capabilities(capabilities)
			end,
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			-- Set keymaps
			local keymap = vim.keymap.set
			local kopts = { noremap = true, silent = true }
			keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
			keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
			keymap("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
			keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
			keymap("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
			keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder" })
			keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder" })
			keymap("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, { desc = "List Workspace Folders" })
			keymap("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type Definition" })
			keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
			keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			keymap("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })
			keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to Previous Diagnostic" })
			keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to Next Diagnostic" })
			keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set Loclist" })

			-- === MASON SETUP ===
			require("mason").setup()
			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
			})

			-- === NEW: Use `handlers` (not `setup_handlers`) ===
			-- CORRECT: Use `setup_handlers`? NO! Use `setup({ handlers = { ... } })`
			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(opts.servers),
				handlers = { -- This is the key
					function(server_name)
						local server_opts = vim.tbl_deep_extend("force", {
							on_attach = opts.on_attach,
							capabilities = opts.capabilities(),
						}, opts.servers[server_name] or {})
						lspconfig[server_name].setup(server_opts)
					end,
				},
			})

			-- === OPTIONAL: Manual enable (if you want full control) ===
			-- for _, server in ipairs(vim.tbl_keys(opts.servers)) do
			--   vim.lsp.enable(server)
			-- end
		end,
	},
}
