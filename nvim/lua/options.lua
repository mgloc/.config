-- [[ Leader keys ]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ UI ]]
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.list = true
vim.o.listchars = "tab:» ,trail:·,nbsp:␣"
vim.o.scrolloff = 10
vim.o.wrap = false
vim.o.showmode = false
vim.o.termguicolors = true
vim.o.winborder = "rounded"
vim.o.guicursor = ""

-- [[ Mouse ]]
vim.o.mouse = "a"

-- [[ Clipboard ]]
vim.o.clipboard = "unnamedplus"
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- [[ Indentation ]]
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- [[ Search ]]
vim.o.ignorecase = true
vim.o.smartcase = true

-- [[ Splits ]]
vim.o.splitright = true
vim.o.splitbelow = true

-- [[ Files ]]
vim.o.undofile = true
vim.o.swapfile = false
vim.o.backup = false

-- [[ Command ]]
vim.o.inccommand = "split"

-- [[ Misc ]]
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])
