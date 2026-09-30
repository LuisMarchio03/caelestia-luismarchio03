-- .NET 8 / .NET 10 (C#) configuration
return {
  -- Mason: ensure these tools are installed
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "omnisharp",
        "netcoredbg",
        "csharpier",
      })
    end,
  },

  -- LSP: OmniSharp for C#
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          enable_editorconfig_support = true,
          enable_ms_build_load_projects_on_demand = false,
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
          sdk_include_prereleases = true,
          analyze_open_documents_only = false,
          handlers = {
            ["textDocument/definition"] = function(...)
              -- Use omnisharp's go-to-definition
              return require("omnisharp_extended").handler(...)
            end,
          },
        },
      },
    },
  },

  -- omnisharp-extended for better go-to-def in .NET
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    lazy = true,
  },

  -- Formatter: CSharpier
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cs = { "csharpier" },
      },
      formatters = {
        csharpier = {
          command = "dotnet-csharpier",
          args = { "--write-stdout" },
          stdin = true,
        },
      },
    },
  },

  -- Treesitter: C# parser
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c_sharp",
        "xml",
        "json",
      },
    },
  },

  -- DAP: .NET debugger
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      dap.adapters.coreclr = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
        args = { "--interpreter=vscode" },
      }
      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "Launch .NET (ask for dll)",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to dll: ",
              vim.fn.getcwd() .. "/bin/Debug/",
              "file"
            )
          end,
        },
        {
          type = "coreclr",
          name = "Attach to process",
          request = "attach",
          processId = require("dap.utils").pick_process,
        },
      }
    end,
  },

  -- Which-key groups for .NET
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>c", group = "code/dotnet" },
      },
    },
  },
}
