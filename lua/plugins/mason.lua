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
			"tsserver", -- LSP
			"omnisharp", -- C# LSP
			"tsx",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
	end,
}
