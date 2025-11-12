return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonLog" },
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
		ensure_installed = {
			"netcoredbg", -- C# debugger
			"js-debug-adapter", -- JS/TS debugger
			"stylua", -- Lua formatter
			"black", -- Python
			"prettier", -- JS/TS/HTML
			"ts_ls", -- LSP
			"omnisharp", -- C# LSP
			"tsx",
			"lua_ls", -- Lua LSP
			"pyright", -- Python LSP
			"eslint_d", -- JS/TS linter
			"eslint", -- JS/TS linter
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
	end,
}
