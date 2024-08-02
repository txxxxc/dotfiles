local vscode = require('vscode')

vim.api.nvim_set_keymap(
  'n',
  '<leader>gw',
  "<Cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
  { noremap = true, silent = true }
)

-- lsp
vim.api.nvim_set_keymap(
  'n',
  'gr',
  "<Cmd>lua require('vscode').action('editor.action.goToReferences')<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>rn',
  "<Cmd>lua require('vscode').action('editor.action.rename')<CR>",
  { noremap = true, silent = true }
)

-- editor.action.marker.next
-- editor.action.marker.prev
-- editor.action.marker.this
-- editor.action.marker.nextInFiles
-- editor.action.marker.prevInFiles

vim.api.nvim_set_keymap(
  'n',
  '[d',
  "<Cmd>lua require('vscode').action('editor.action.marker.prev')<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  ']d',
  "<Cmd>lua require('vscode').action('editor.action.marker.next')<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '[D',
  "<Cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  ']D',
  "<Cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<CR>",
  { noremap = true, silent = true }
)



-- sidebar
vim.api.nvim_set_keymap(
  'n',
  '<leader>e',
  "<Cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>",
  { noremap = true, silent = true }
)


-- git diff
vim.api.nvim_set_keymap(
  'n',
  '[c',
  "<Cmd>lua require('vscode').action('workbench.action.editor.previousChange')<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  ']c',
  "<Cmd>lua require('vscode').action('workbench.action.editor.nextChange')<CR>",
  { noremap = true, silent = true }
)


function Toggle_terminal()
  require('vscode').action('workbench.action.terminal.toggleTerminal')
  require('vscode').action('workbench.action.terminal.moveIntoNewWindow')
end

-- implement create new terminal
vim.api.nvim_set_keymap(
  'n',
  '<leader>t',
  "<Cmd>lua Toggle_terminal()<CR>",
  { noremap = true, silent = true }
)

local function write_vscode_commands_to_file()
  local commands = require('vscode').eval('return vscode.commands.getCommands()')
  local file = io.open("commands.txt", "w")
  if file then
    file:write("")  -- This will clear the file contents
    for _, command in ipairs(commands) do
      file:write(command .. "\n")
    end
    file:close()
  else
    print("Error: Could not open file commands.txt for writing")
  end
end


write_vscode_commands_to_file()
print("Commands written to commands.txt")
