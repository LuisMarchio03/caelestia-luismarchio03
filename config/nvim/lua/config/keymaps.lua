-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local map = vim.keymap.set

-- Better escape
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered on jumps
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Better indenting in visual
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Paste without overwriting register
map("x", "<leader>p", [["_dP]], { desc = "Paste without losing register" })

-- Delete to black hole register
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void register" })

-- Quick save
map("n", "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "i", "v" }, "<C-s>", "<esc><cmd>w<cr>", { desc = "Save file" })

-- LSP inlay hints toggle
map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- .NET / C# specific
map("n", "<leader>cr", "<cmd>!dotnet run<cr>", { desc = "dotnet run" })
map("n", "<leader>cb", "<cmd>!dotnet build<cr>", { desc = "dotnet build" })
map("n", "<leader>ct", "<cmd>!dotnet test<cr>", { desc = "dotnet test" })
