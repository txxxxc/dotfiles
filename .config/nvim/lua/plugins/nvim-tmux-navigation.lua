return {
	'alexghergh/nvim-tmux-navigation',
	cond = not vim.g.vscode,
	config = function()
		require('nvim-tmux-navigation').setup {
			disable_when_zoomed = false, -- defaults to false
			keybindings = {
				left = "<c-h>",
				down = "<c-j>",
				up = "<c-k>",
				right = "<c-l>",
			}
		}
	end
}
