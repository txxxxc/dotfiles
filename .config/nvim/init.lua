vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("utils").init()
require("lazy").setup "plugins"
require "editor"
require "plugins"
require "keymaps"
require "autocmd"
require "commands"
if vim.g.vscode then require "vscode_neovim" end
