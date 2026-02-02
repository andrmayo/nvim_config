return {
  "nvim-telescope/telescope.nvim",
  branch = "master", -- Use latest version instead of old tag
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local action_state = require("telescope.actions.state")
    local from_entry = require("telescope.from_entry")

    local function open_in_background(_)
      local entry = action_state.get_selected_entry()
      if not entry then
        return
      end
      local filepath = from_entry.path(entry, false, false)
      if filepath then
        local bufnr = vim.fn.bufadd(filepath)
        vim.fn.bufload(bufnr)
        vim.bo[bufnr].buflisted = true
      end
    end

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<C-b>"] = open_in_background,
          },
          n = {
            ["<C-h>"] = "which_key",
            ["<C-b>"] = open_in_background,
          },
        },
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
