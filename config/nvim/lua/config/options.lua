-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
local opt = vim.opt

-- Appearance
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.cmdheight = 0
opt.pumblend = 0
opt.winblend = 0
opt.laststatus = 3

-- Font for GUI clients (Neovide etc)
vim.opt.guifont = "CaskaydiaCove NF:h12"

-- Editing
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftround = true

-- Search
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- Completion
opt.pumheight = 12

-- Folding (treesitter-based via LazyVim)
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.require'lazyvim.util'.treesitter.foldexpr()"
opt.foldtext = ""

-- Better list chars
opt.list = true
opt.listchars = {
  tab = "→ ",
  trail = "·",
  nbsp = "␣",
}

-- Spelling
opt.spelllang = { "en_us", "pt_br" }

-- Smooth scrolling (Neovim 0.10+)
opt.smoothscroll = true
