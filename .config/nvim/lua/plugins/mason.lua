return {
	"williamboman/mason.nvim",
	enabled = true,
	cmd = { "Mason" },
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
