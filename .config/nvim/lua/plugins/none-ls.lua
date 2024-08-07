return {
	"nvimtools/none-ls.nvim",
    cond = not vim.g.vscode,
	config = function()
		local null_ls = require "null-ls"
		null_ls.setup {
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.cppcheck,
				null_ls.builtins.diagnostics.fish,
			},
			debug = true,
		}
	end,
	on_attach = function(client, bufnr) end,
}
