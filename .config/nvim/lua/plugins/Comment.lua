return {
	'numToStr/Comment.nvim',
	-- これなくても動くはずなんだけどなぁ
	config = function()
		require('Comment').setup({
			pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
		})
	end,
	lazy = false,
}
