return {
  -- Disable defaults, use Caelestia
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim",       enabled = false },

  -- Load the local Caelestia colorscheme
  {
    "caelestia",
    dir = vim.fn.stdpath("config"),
    name = "caelestia",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("caelestia")
    end,
  },

  -- Tell LazyVim to use Caelestia
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "caelestia" },
  },
}
