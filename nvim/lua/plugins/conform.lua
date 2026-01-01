return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Add markdown formatting with prettier
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.markdown = { "prettier" }

    opts.formatters = opts.formatters or {}
    opts.formatters.prettier = {
      prepend_args = { "--prose-wrap", "always", "--print-width", "80" },
    }

    return opts
  end,
}
