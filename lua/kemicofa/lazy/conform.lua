return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    opts = {
        formatters_by_ft = {
          javascript        = { "prettierd", "prettier" },
          typescript        = { "prettierd", "prettier" },
          javascriptreact   = { "prettierd", "prettier" },
          typescriptreact   = { "prettierd", "prettier" },
          json              = { "prettierd", "prettier" },
          css               = { "prettierd", "prettier" },
          html              = { "prettierd", "prettier" },
          markdown          = { "prettierd", "prettier" },
          yaml              = { "prettierd", "prettier" },
          svelte            = { "prettierd", "prettier" },
          rust              = { "rustfmt" }
        },

        format_on_save = {
            timeout_ms = 800,
            lsp_fallback = true
        },
        formatters = {
            rustfmt = {
                prepend_args = { "--emit=stdout" }
            }
        },

        keys = {
            { "<leader>f", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format file" },
        }
    }
}
