-- lua/core/options.lua

-- Encoding
vim.opt.encoding = "utf-8"

-- Swap/undo/backup directories
vim.opt.undodir = vim.fn.expand("~/.nvim/undo")
vim.opt.directory = vim.fn.expand("~/.nvim/swp")
vim.opt.backupdir = vim.fn.expand("~/.nvim/backup")

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.statusline = [[%F%m%r%h%w%=(%{&ff}/%Y) (line %l/%L, col %c)]]

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false

-- Smoothie scroll tweak
vim.g.smoothie_update_interval = 20
vim.g.smoothie_speed_constant_factor = 2

-- Python host
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenv/neovim/bin/python")

