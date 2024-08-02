local RESULT_BUFFER = 'RESULT_BUFFER'

local result_buffer = 0
vim.api.nvim_create_user_command('AtcoderInit',
	function()
		-- bufferを新しく作る
		local buf = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_buf_set_name(buf, RESULT_BUFFER)
		result_buffer = buf
	end,
	{}
)

-- h	a hidden buffer: It is loaded, but currently not displayed in a window |hidden-buffer

vim.api.nvim_create_user_command('AtcoderExec',
	function()
		-- 実行結果を保存
		local _result = vim.fn.system(
			'exe index.cpp && time begin; timeout 2 ./a.out < stdin.txt; end;')
		local result = {}
		if _result then
			result = vim.split(_result, '\n')
		end

		-- bufferが表示されているかを確認する
		-- なんか型で怒られてるけどうまくいってるからいいか
		if vim.fn.getbufinfo(result_buffer)[1].hidden == 1 then
			-- 結果表示用のwindowを作る
			vim.cmd.vsplit()
			local win = vim.api.nvim_get_current_win()
			vim.api.nvim_win_set_buf(win, result_buffer)
			vim.api.nvim_buf_set_lines(result_buffer, 0, -1, false, result)
		else
			vim.api.nvim_buf_call(result_buffer,
				function()
					vim.api.nvim_buf_set_lines(result_buffer, 0, -1, false, result)
				end
			)
		end
		vim.api.nvim_win_set_cursor(0, { vim.fn.line('$'), 0 })
	end,
	{}
)

vim.keymap.set('n', '<leader>q', ':AtcoderExec<CR>', { silent = true })

vim.keymap.set('n', '<leader>rl', ':lua dofile(vim.env.MYVIMRC)<CR>', { silent = true })
vim.keymap.set('n', '<leader>vs', ':luafile %<CR>', { silent = true })