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

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sm", require("telescope.builtin").man_pages, { desc = "[S]earch [M]an" })
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "[G]it [S]tatus" })
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.keymap.set("n", "<leader>rl", ":luafile %<CR>", { desc = "[R]eload init.[L]ua", silent = true })
vim.keymap.set("n", "<ESC><ESC>", ":nohl <CR>", { desc = "erase highlights", silent = true })
-- vim.keymap.set('n', '<C-n>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>', { desc = 'toggle Fern', silent = true })
vim.keymap.set(
  "n",
  "<leader>e",
  ":Fern . -reveal=% -drawer -toggle -width=40<CR>",
  { desc = "toggle Fern", silent = true }
)
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
