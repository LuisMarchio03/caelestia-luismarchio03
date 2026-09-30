-- TypeScript / JavaScript / React / Node.js (pnpm) configuration
return {
  -- Mason: ensure tools are installed
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "typescript-language-server",
        "vtsls",
        "eslint-lsp",
        "prettier",
        "css-lsp",
        "html-lsp",
        "tailwindcss-language-server",
        "json-lsp",
      })
    end,
  },

  -- LSP: vtsls (preferred over ts_ls for React/Next.js)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              preferences = {
                importModuleSpecifier = "non-relative",
              },
            },
            javascript = {
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
            },
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
          },
          on_attach = function(client, bufnr)
            -- Use pnpm's local TypeScript if available
            local root = vim.fs.root(bufnr, { "pnpm-workspace.yaml", "package.json", ".git" })
            if root then
              local pnpm_ts = root .. "/node_modules/typescript/lib"
              if vim.fn.isdirectory(pnpm_ts) == 1 then
                if client.config.settings then
                  client.config.settings.typescript = client.config.settings.typescript or {}
                  client.config.settings.typescript.tsdk = pnpm_ts
                end
              end
            end
          end,
        },

        cssls = {},
        html = {},

        tailwindcss = {
          filetypes = {
            "html", "css", "scss", "javascript", "javascriptreact",
            "typescript", "typescriptreact", "svelte", "vue",
          },
          settings = {
            tailwindCSS = {
              classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "cn\\(([^)]*)\\)", "'([^']*)'" },
                  { "clsx\\(([^)]*)\\)", "'([^']*)'" },
                },
              },
            },
          },
        },
      },
    },
  },

  -- Formatter: Prettier with pnpm support
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript      = { "prettier" },
        javascriptreact = { "prettier" },
        typescript      = { "prettier" },
        typescriptreact = { "prettier" },
        css             = { "prettier" },
        scss            = { "prettier" },
        html            = { "prettier" },
        json            = { "prettier" },
        jsonc           = { "prettier" },
        yaml            = { "prettier" },
        markdown        = { "prettier" },
        graphql         = { "prettier" },
      },
      formatters = {
        prettier = {
          -- Prefer project-local prettier (via pnpm)
          command = function(ctx)
            local local_prettier = ctx.dirname .. "/node_modules/.bin/prettier"
            if vim.fn.executable(local_prettier) == 1 then
              return local_prettier
            end
            return "prettier"
          end,
        },
      },
    },
  },

  -- Treesitter: JS/TS/JSX/TSX parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",
        "json",
        "jsonc",
        "yaml",
        "graphql",
        "prisma",
      },
    },
  },

  -- TypeScript extra utilities (refactors, organize imports, etc.)
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact" },
    config = true,
  },

  -- package.json dependency management
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("package-info").setup({
        colors = {
          up_to_date = "#918f9a",
          outdated = "#bfa6fe",
        },
        icons = {
          enable = true,
          style = {
            up_to_date = "| ",
            outdated = "| ",
          },
        },
        autostart = false,
        hide_up_to_date = true,
      })
      -- keymaps for package.json
      vim.keymap.set("n", "<leader>np", require("package-info").show, { desc = "Show package versions", silent = true })
      vim.keymap.set("n", "<leader>nc", require("package-info").hide, { desc = "Hide package versions", silent = true })
      vim.keymap.set("n", "<leader>nu", require("package-info").update, { desc = "Update package", silent = true })
      vim.keymap.set("n", "<leader>nd", require("package-info").delete, { desc = "Delete package", silent = true })
      vim.keymap.set("n", "<leader>ni", require("package-info").install, { desc = "Install package", silent = true })
      vim.keymap.set("n", "<leader>nv", require("package-info").change_version, { desc = "Change version", silent = true })
    end,
  },
}
