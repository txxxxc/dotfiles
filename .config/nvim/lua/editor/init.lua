-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme nordfox]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- QuickRun
vim.o.splitright = true

-- Stop automatic newline continuation of comments
vim.opt.formatoptions:remove "c"
vim.opt.formatoptions:remove "r"
vim.opt.formatoptions:remove "o"

-- Use os clipboard
vim.cmd "set clipboard+=unnamedplus"
vim.cmd "highlight TabLineFill guibg=#00000000"
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- setup show tabline
vim.o.showtabline = 2
vim.cmd [[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]]
-- setup termguicolors
vim.opt.termguicolors = true

-- disable diagnostics text on editor
-- vim.diagnostic.config({
--   virtual_text = false
-- })
vim.api.nvim_set_hl(0, "BufferCurrent", { ctermbg = 0, bg = nil })
vim.api.nvim_set_hl(0, "BufferCurrentERROR", { ctermbg = 0, bg = nil })
vim.api.nvim_set_hl(0, "BufferCurrentHINT", { ctermbg = 0, bg = nil })
vim.api.nvim_set_hl(0, "BufferCurrentSign", { ctermbg = 0, bg = nil })
vim.api.nvim_set_hl(0, "BufferCurrentIcon", { ctermbg = 0, bg = nil })
vim.api.nvim_set_hl(0, "BufferCurrentINFO", { ctermbg = 0, bg = nil })
vim.api.nvim_set_hl(0, "BufferCurrentWARN", { ctermbg = 0, bg = nil })
vim.api.nvim_set_hl(0, "BufferCurrentMod", { ctermbg = 0, bg = nil })
