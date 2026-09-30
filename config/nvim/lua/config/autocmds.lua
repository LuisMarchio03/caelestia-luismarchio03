-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("caelestia_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "Search", timeout = 150 })
  end,
})

-- Close certain filetypes with just q
autocmd("FileType", {
  group = vim.api.nvim_create_augroup("caelestia_close_q", { clear = true }),
  pattern = { "help", "lspinfo", "man", "notify", "qf", "checkhealth", "startuptime" },
  callback = function(ev)
    vim.bo[ev.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = ev.buf, silent = true })
  end,
})

-- Restore cursor on file open
autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("caelestia_restore_cursor", { clear = true }),
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(ev.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-create dirs on save
autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("caelestia_auto_mkdir", { clear = true }),
  callback = function(ev)
    if ev.match:match("^%w%w+://") then return end
    local file = vim.uv.fs_realpath(ev.match) or ev.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Set correct filetype for .csx (C# scripts)
autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("caelestia_csx", { clear = true }),
  pattern = "*.csx",
  callback = function() vim.bo.filetype = "cs" end,
})

-- pnpm workspace: treat pnpm-workspace.yaml as yaml
autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("caelestia_pnpm", { clear = true }),
  pattern = "pnpm-workspace.yaml",
  callback = function() vim.bo.filetype = "yaml" end,
})
