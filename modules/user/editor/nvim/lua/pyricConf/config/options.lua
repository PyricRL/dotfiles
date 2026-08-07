local opt = vim.opt

opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 8

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.showmatch = true
opt.matchtime = 2
opt.virtualedit = "block"

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

opt.splitbelow = true
opt.splitright = true

opt.redrawtime = 10000
opt.maxmempattern = 20000

opt.updatetime = 500

opt.fillchars = {
  eob = " "
}

opt.signcolumn = "auto"
opt.signcolumn = "yes"
