return {
	'nvim-telescope/telescope-fzf-native.nvim',
	build = 'make',
	cond = not vim.g.vscode and vim.fn.executable 'make' == 1
}
