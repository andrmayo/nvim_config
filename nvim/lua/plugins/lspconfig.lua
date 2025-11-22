return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Force UTF-16 encoding for Python LSP servers to avoid pyright/ruff conflict
      servers = {
        pyright = {
          capabilities = {
            general = {
              positionEncodings = { "utf-16" },
            },
          },
        },
        ruff = {
          capabilities = {
            general = {
              positionEncodings = { "utf-16" },
            },
          },
        },
      },
    },
  },
}
