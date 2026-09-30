return {
  -- Lualine with Caelestia theme
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local caelestia = require("caelestia.lualine")
      opts.options = vim.tbl_extend("force", opts.options or {}, {
        theme = caelestia,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      })
      opts.sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
        },
        lualine_b = {
          { "branch", icon = "" },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_c = {
          { "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "" } },
          {
            function()
              local ok, navic = pcall(require, "nvim-navic")
              return ok and navic.get_location() or ""
            end,
            cond = function()
              local ok, navic = pcall(require, "nvim-navic")
              return ok and navic.is_available()
            end,
          },
        },
        lualine_x = {
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          },
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
          },
          { "filetype", icon_only = false },
        },
        lualine_y = {
          { "progress", separator = "", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          { "encoding", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
        },
      }
      return opts
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "slant",
        always_show_bufferline = false,
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
      highlights = {
        background          = { bg = "#0e0e11" },
        fill                = { bg = "#0e0e11" },
        tab                 = { bg = "#0e0e11", fg = "#918f9a" },
        tab_selected        = { bg = "#2a292e", fg = "#e5e1e7", bold = true },
        tab_separator       = { bg = "#0e0e11", fg = "#0e0e11" },
        tab_separator_selected = { bg = "#2a292e", fg = "#0e0e11" },
        buffer_visible      = { bg = "#131317", fg = "#c7c5d1" },
        buffer_selected     = { bg = "#2a292e", fg = "#e5e1e7", bold = true },
        separator           = { bg = "#0e0e11", fg = "#0e0e11" },
        separator_selected  = { bg = "#2a292e", fg = "#0e0e11" },
        separator_visible   = { bg = "#131317", fg = "#131317" },
        indicator_selected  = { bg = "#2a292e", fg = "#bfc1ff" },
        modified            = { bg = "#0e0e11", fg = "#aeb8ff" },
        modified_selected   = { bg = "#2a292e", fg = "#aeb8ff" },
        close_button        = { bg = "#0e0e11", fg = "#46464f" },
        close_button_selected = { bg = "#2a292e", fg = "#918f9a" },
        numbers             = { bg = "#0e0e11", fg = "#46464f" },
        numbers_selected    = { bg = "#2a292e", fg = "#c7c5d1" },
        diagnostic          = { bg = "#0e0e11" },
        diagnostic_selected = { bg = "#2a292e" },
      },
    },
  },

  -- Noice (cmdline + messages)
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
      lsp = {
        progress = { enabled = true },
        hover = { enabled = true },
        signature = { enabled = true },
      },
      cmdline = {
        format = {
          cmdline = { icon = ">" },
          search_down = { icon = "/ ↓" },
          search_up = { icon = "/ ↑" },
          filter = { icon = "$" },
          lua = { icon = "☽" },
          help = { icon = "?" },
        },
      },
    },
  },

  -- Dashboard (snacks.nvim)
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
   ██████╗ █████╗ ███████╗██╗     ███████╗███████╗████████╗██╗ █████╗
  ██╔════╝██╔══██╗██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝██║██╔══██╗
  ██║     ███████║█████╗  ██║     █████╗  ███████╗   ██║   ██║███████║
  ██║     ██╔══██║██╔══╝  ██║     ██╔══╝  ╚════██║   ██║   ██║██╔══██║
  ╚██████╗██║  ██║███████╗███████╗███████╗███████║   ██║   ██║██║  ██║
   ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═╝]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "recent_files", limit = 5, padding = 1 },
          { section = "projects", padding = 1 },
          { section = "startup" },
        },
      },
      indent = {
        animate = { enabled = true },
        char = "│",
      },
      notifier = {
        enabled = true,
        timeout = 3000,
        top_down = false,
      },
      scroll = { enabled = true },
      words = { enabled = true },
    },
  },

  -- Better window separators
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true },
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      },
    },
  },

  -- Rainbow delimiters
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
    config = function()
      local rainbow = require("rainbow-delimiters")
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = rainbow.strategy["global"],
          vim = rainbow.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterViolet",
          "RainbowDelimiterBlue",
          "RainbowDelimiterCyan",
          "RainbowDelimiterGreen",
          "RainbowDelimiterYellow",
          "RainbowDelimiterOrange",
          "RainbowDelimiterRed",
        },
      })
      -- Caelestia-matched rainbow colors
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#bfc1ff" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",   { fg = "#aeb8ff" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan",   { fg = "#c8e3ff" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen",  { fg = "#d2e0ff" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#ffecf3" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#e0c2f9" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterRed",    { fg = "#bfa6fe" })
    end,
  },

  -- CSS color preview
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    opts = {
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        css = true,
        mode = "background",
        tailwind = true,
      },
    },
  },
}
