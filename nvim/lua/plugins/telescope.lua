return {
  "nvim-telescope/telescope.nvim",
  branch = "master", -- Use latest version instead of old tag
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        preview = {
          treesitter = false, -- Disable treesitter in previews to avoid ft_to_lang error
        },
      },
    })

    vim.keymap.set("n", "<space>/", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files, { desc = "Telescope find in dir" })
    vim.keymap.set("n", "<space>en", function()
      require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("config"),
      })
    end, { desc = "Telescope edit nvim" })
  end,
}
