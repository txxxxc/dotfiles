-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>rl", ":luafile %<CR>", { desc = "[R]eload init.[L]ua", silent = true })
vim.keymap.set("n", "<ESC><ESC>", ":nohl <CR>", { desc = "erase highlights", silent = true })
vim.keymap.set("", "<S-h>", "^")
vim.keymap.set("", "<S-l>", "$")
vim.keymap.set("i", "<C-f>", "<C-O>a")
vim.keymap.set("i", "<C-b>", "<C-O>h")
vim.keymap.set("n", "<S-Q>", ":q<CR>")
vim.keymap.set("n", "<leader>a", "ggVG")
vim.keymap.set("", "]b", ":bnext<CR>", { desc = "move buffer", silent = true })
vim.keymap.set("", "[b", ":bprev<CR>", { desc = "move buffer", silent = true })
vim.keymap.set("n", "<leader>c", "<Cmd>BufferClose<CR>", { desc = "delete buffer", silent = true })
vim.keymap.set("n", "|", "<Cmd>vsplit<CR>", { desc = "Vertical Split", silent = true })
vim.keymap.set("n", "\\", "<Cmd>split<CR>", { desc = "Vertical Split", silent = true })

-- https://zenn.dev/vim_jp/articles/2024-06-05-vim-middle-class-features
for _, quote in ipairs({ '"', "'", "`" }) do
  vim.keymap.set({ "x", "o" }, "a" .. quote, "2i" .. quote)
end
