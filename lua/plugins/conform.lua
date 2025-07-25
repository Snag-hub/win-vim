return {
  "stevearc/conform.nvim",
  lazy = false,
  keys = {
    { "<leader>fm", function() require("conform").format({ async = true, lsp_fallback = true }) end, mode = "n", desc = "Format file or range (in visual mode)" },
  },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
      stop_after_first = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      -- You can add more formatters here for other languages
    },
  },
}
