return {
	'phaazon/hop.nvim',
	branch = 'v2',
	config = function()
		local hop = require 'hop'
		hop.setup { keys = 'etovxqpdygfblzhckisuran' }
		local directions = require('hop.hint').HintDirection
		vim.keymap.set('', 'f', function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, { remap = true })
		vim.keymap.set('', 'F', function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, { remap = true })
		-- vim.keymap.set('', 't', function()
		-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		-- end, { remap = true })
		-- vim.keymap.set('', 'T', function()
		-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		-- end, { remap = true })
		vim.api.nvim_set_keymap('n', '<leader><leader>w', '<cmd>HopWord<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<leader><leader>l', '<cmd>HopLineStart<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<leader><leader>f', '<cmd>HopChar1<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<leader><leader>F', '<cmd>HopChar2<CR>', { noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<leader><leader>p', '<cmd>HopPattern<CR>', { noremap = true, silent = true })
	end
}
