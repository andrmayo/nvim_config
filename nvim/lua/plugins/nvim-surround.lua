-- nvim-surround: add, change, and delete surrounding pairs
--
-- Usage:
--   ys<motion><char>  add surrounding    e.g. ysiw( wraps word in ( )
--   yss<char>         surround line      e.g. yss" wraps line in ""
--   cs<old><new>      change surrounding e.g. cs(" changes ( ) to ""
--   ds<char>          delete surrounding e.g. ds( removes ( )
--   S<char>           surround selection (visual mode)
--
-- Available chars:
--   ( ) b  ->  (word)
--   [ ]    ->  [word]
--   { } B  ->  {word}
--   >      ->  <word>
--   t      ->  <tag>word</tag>  (prompts for tag)
--   f      ->  func(word)       (prompts for function name)

return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      surrounds = {
        -- ( ) and b all produce parens: (word)
        ["("] = { add = { "(", ")" } },
        [")"] = { add = { "(", ")" } },
        ["b"] = { add = { "(", ")" } },
        -- [ ] produce brackets: [word]
        ["["] = { add = { "[", "]" } },
        ["]"] = { add = { "[", "]" } },
        -- { } and B produce braces: {word}
        ["{"] = { add = { "{", "}" } },
        ["}"] = { add = { "{", "}" } },
        ["B"] = { add = { "{", "}" } },
        -- > produces angle brackets: <word>
        [">"] = { add = { "<", ">" } },
      },
    })
  end,
}
