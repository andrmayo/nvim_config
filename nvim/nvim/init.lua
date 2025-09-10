-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Yes, we're just executing a bunch of Vimscript, but this is the officially
-- endorsed method; see https://github.com/L3MON4D3/LuaSnip#keymaps
vim.cmd([[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls", "rust_analyzer", "lemminx" },
})

require("lspconfig").elixirls.setup({
  -- Unix
  cmd = { "/opt/elixir-ls/language_server.sh" },
})

require("nvim-treesitter").setup()

require("dap-python").setup("python")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.jsonl", "*.json" },
  callback = function()
    vim.cmd("%!jq '.'")
    -- Reapply syntax highlighting
    vim.cmd("set filetype=json")
  end,
})

-- disable pairwise autocomplete for ' and when working with lisp files

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lisp",
  callback = function()
    -- This disables quote-pairing for this buffer only
    vim.schedule(function()
      require("mini.pairs").unmap_buf(0, "i", "'", "'")
      vim.keymap.set("i", "'", "'", { buffer = true })
    end)
  end,
})
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
