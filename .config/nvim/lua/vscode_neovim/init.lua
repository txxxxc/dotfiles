local vscode = require('vscode')

vim.api.nvim_set_keymap(
  'n',
  '<leader>gw',
  "<Cmd>lua require('vscode').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>e',
  "<Cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>",
  { noremap = true, silent = true }
)

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

vim.api.nvim_set_keymap(
  'n',
  '<leader>rn',
  "<Cmd>lua require('vscode').action('editor.action.rename')<CR>",
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
  print(commands)
end

write_vscode_commands_to_file()
