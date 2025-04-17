-- Thanks to Josean Martinez at https://www.youtube.com/watch?v=6pAG3BHurdM&ab_channel=JoseanMartinez

-- sets the default explorer to tree mode
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentations
opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
-- opt.expandtab = true -- exapnds tabs to spaces
opt.autoindent = true -- copy indent from current line when start new one

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assume you want case-sensitiv

opt.cursorline = true

-- proper colors and theming
opt.termguicolors = true
opt.background = "dark" -- colorschemes that cna be light or dark will be dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- never let the cursor hit the bottom of the screen
opt.scrolloff = 5
