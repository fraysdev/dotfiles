-- General
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Indentations
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.tabstop = 4         -- Set width of tabs
vim.opt.softtabstop = 4     -- Detecting space so the tabs always even
vim.opt.shiftwidth = 4      -- Auto-indenting
vim.opt.smartindent = true  -- Auto-indenting

-- Line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Line column
-- vim.opt.colorcolumn = "80"

-- Format options
vim.opt.formatoptions = "tj"    -- def: tcqj

-- Wrap
vim.opt.wrap = false

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true    -- Increment search

-- Scroll
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"

