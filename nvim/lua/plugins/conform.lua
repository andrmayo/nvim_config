return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Add markdown formatting with prettier
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.markdown = { "prettier" }

    opts.formatters_by_ft.html = { "prettier" }
    opts.formatters_by_ft.gohtml = { "prettier" }

    opts.formatters = opts.formatters or {}
    opts.formatters.prettier = {
      prepend_args = function(self, ctx)
        local args = { "--prose-wrap", "always", "--print-width", "80" }
        local ft = vim.bo[ctx.buf].filetype
        if ft == "gohtml" or ft == "html" then
          table.insert(args, "--parser")
          table.insert(args, "html")
        end
        return args
      end,
    }

    return opts
  end,
}
