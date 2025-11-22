return {
  "nvim-telescope/telescope.nvim",
  branch = "master",  -- Use latest version instead of old tag
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        preview = {
          treesitter = false,  -- Disable treesitter in previews to avoid ft_to_lang error
        },
      },
    })

    vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
    vim.keymap.set("n", "<space>en", function()
      require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("config"),
      })
    end)
  end,
}
