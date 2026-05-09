return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "lua_ls" },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
          },
        },
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
            cargo = { allFeatures = true },
            inlayHints = { enable = true },
          },
        },
      })

      -- LSP keymaps on attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func)
            vim.keymap.set("n", keys, func, { buffer = event.buf })
          end
          map("gd", vim.lsp.buf.definition)
          map("gD", vim.lsp.buf.declaration)
          map("gr", vim.lsp.buf.references)
          map("gi", vim.lsp.buf.implementation)
          map("K", vim.lsp.buf.hover)
          map("<leader>ca", vim.lsp.buf.code_action)
          map("<leader>rn", vim.lsp.buf.rename)
          map("[d", vim.diagnostic.goto_prev)
          map("]d", vim.diagnostic.goto_next)
          map("<leader>e", vim.diagnostic.open_float)
        end,
      })

      vim.diagnostic.config({
        virtual_lines = { current_line = true },
        signs = true,
        update_in_insert = false,
        float = { border = "rounded" },
      })
    end,
  },
}
