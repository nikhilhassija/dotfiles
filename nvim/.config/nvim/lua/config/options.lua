local opt = vim.opt

--------------------------------------------------
-- UI
--------------------------------------------------

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true

--------------------------------------------------
-- Editing
--------------------------------------------------

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.wrap = false

--------------------------------------------------
-- Search
--------------------------------------------------

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

--------------------------------------------------
-- Scrolling
--------------------------------------------------

opt.scrolloff = 8
opt.sidescrolloff = 8

--------------------------------------------------
-- Splits
--------------------------------------------------

opt.splitbelow = true
opt.splitright = true
opt.equalalways = false

--------------------------------------------------
-- Mouse & Clipboard
--------------------------------------------------

opt.mouse = "a"
opt.clipboard = "unnamedplus"

--------------------------------------------------
-- Performance
--------------------------------------------------

opt.timeoutlen = 300
opt.updatetime = 250

--------------------------------------------------
-- Files
--------------------------------------------------

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

--------------------------------------------------
-- Completion
--------------------------------------------------

opt.completeopt = {
    "menu",
    "menuone",
    "noselect",
}

--------------------------------------------------
-- Command line
--------------------------------------------------

opt.showmode = false
opt.showcmd = false

--------------------------------------------------
-- Undo
--------------------------------------------------

local undodir = vim.fn.stdpath("state") .. "/undo"
vim.fn.mkdir(undodir, "p")

opt.undodir = undodir
opt.undofile = true

--------------------------------------------------
-- Messages
--------------------------------------------------

opt.shortmess:append("c")
