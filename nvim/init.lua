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

-- LazyVim handles Mason and LSP setup automatically via extras
-- Only manual LSP setup needed for non-standard servers:
require("lspconfig").elixirls.setup({
  -- Unix
  cmd = { "/opt/elixir-ls/language_server.sh" },
})

require("nvim-treesitter").setup()

require("dap-python").setup("python")

-- JSONL validation on file open (non-destructive)
-- Manual jq commands for JSONL files:
--   Validate:           :!jq empty %
--   Pretty-print:       :%!jq '.' (then run :set ft=json to restore highlighting)
--   Compact format:     :%!jq -c '.'
--   Format with helper: :JqFormat (formats and restores syntax highlighting)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.jsonl" },
  callback = function()
    -- Just validate, don't modify the file
    vim.fn.system("jq empty " .. vim.fn.shellescape(vim.fn.expand("%")))
    if vim.v.shell_error ~= 0 then
      vim.notify("Invalid JSONL", vim.log.levels.WARN)
    end
  end,
})

-- Helper command to format JSON/JSONL with jq and restore syntax highlighting
vim.api.nvim_create_user_command("JqFormat", function()
  vim.cmd("%!jq '.'")
  -- Force treesitter to re-parse by toggling filetype
  vim.cmd("set filetype=")
  vim.cmd("set filetype=json")
end, {})

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
