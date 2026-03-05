return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<space>/", icon = "🔍" },

        -- Vlime mappings (lisp filetype only)
        {
          cond = function()
            return vim.bo.filetype == "lisp"
          end,

          { "<localleader>c", group = "Connection" },
          { "<localleader>cc", desc = "Connect to server" },
          { "<localleader>cs", desc = "Switch connections" },
          { "<localleader>cd", desc = "Disconnect" },
          { "<localleader>cR", desc = "Rename connection" },

          { "<localleader>r", group = "Server/REPL" },
          { "<localleader>rr", desc = "Run new server" },
          { "<localleader>rv", desc = "View server console" },
          { "<localleader>rV", desc = "View selected server" },
          { "<localleader>rs", desc = "Stop current server" },
          { "<localleader>rS", desc = "Stop selected server" },
          { "<localleader>rR", desc = "Rename server" },
          { "<localleader>rt", desc = "Restart server" },
          { "<localleader>rc", desc = "Clear REPL" },

          { "<localleader>s", group = "Send to REPL" },
          { "<localleader>ss", desc = "Send expr/atom at cursor" },
          { "<localleader>se", desc = "Send expression" },
          { "<localleader>st", desc = "Send top-level expression" },
          { "<localleader>sa", desc = "Send atom" },
          { "<localleader>si", desc = "Send snippet" },

          { "<localleader>m", group = "Macro expand" },
          { "<localleader>mm", desc = "Expand macro" },
          { "<localleader>m1", desc = "Expand macro once" },
          { "<localleader>ma", desc = "Expand all macros" },

          { "<localleader>o", group = "Compile" },
          { "<localleader>oe", desc = "Compile expression" },
          { "<localleader>ot", desc = "Compile top-level expression" },
          { "<localleader>of", desc = "Compile file" },

          { "<localleader>x", group = "Cross-reference" },
          { "<localleader>xc", desc = "Show callers" },
          { "<localleader>xC", desc = "Show callees" },
          { "<localleader>xr", desc = "Show references" },
          { "<localleader>xb", desc = "Show bindings" },
          { "<localleader>xs", desc = "Show setters" },
          { "<localleader>xe", desc = "Show macro callers" },
          { "<localleader>xm", desc = "Show specialized methods" },
          { "<localleader>xd", desc = "Show definition" },
          { "<localleader>xi", desc = "Xref interactive" },

          { "<localleader>d", group = "Describe/Documentation" },
          { "<localleader>do", desc = "Describe operator" },
          { "<localleader>da", desc = "Describe atom" },
          { "<localleader>di", desc = "Describe interactive" },
          { "<localleader>ds", desc = "Apropos search" },
          { "<localleader>dd", group = "Documentation" },
          { "<localleader>ddo", desc = "Documentation for operator" },
          { "<localleader>dda", desc = "Documentation for atom" },
          { "<localleader>ddi", desc = "Documentation interactive" },
          { "<localleader>dr", desc = "Show arglist" },

          { "<localleader>I", group = "Inspect" },
          { "<localleader>Ii", desc = "Inspect expr/atom" },
          { "<localleader>Ie", desc = "Inspect expression" },
          { "<localleader>It", desc = "Inspect top-level expr" },
          { "<localleader>Ia", desc = "Inspect atom" },
          { "<localleader>Is", desc = "Inspect symbol" },
          { "<localleader>In", desc = "Inspect snippet" },

          { "<localleader>T", group = "Trace" },
          { "<localleader>Td", desc = "Trace dialog" },
          { "<localleader>Ti", desc = "Trace/untrace interactive" },
          { "<localleader>Tt", desc = "Trace/untrace at cursor" },

          { "<localleader>u", group = "Undefine" },
          { "<localleader>uf", desc = "Undefine function" },
          { "<localleader>us", desc = "Unintern symbol" },
          { "<localleader>ui", desc = "Undefine interactive" },

          { "<localleader>w", group = "Windows" },
          { "<localleader>wp", desc = "Close preview" },
          { "<localleader>wr", desc = "Close arglist" },
          { "<localleader>wn", desc = "Close notes" },
          { "<localleader>wR", desc = "Close REPL" },
          { "<localleader>wA", desc = "Close all Vlime windows" },
          { "<localleader>wl", desc = "Choose window to close" },

          { "<localleader>i", desc = "Interaction mode" },
          { "<localleader>l", desc = "Load file" },
          { "<localleader>a", desc = "Disassemble" },
          { "<localleader>p", desc = "Set package" },
          { "<localleader>b", desc = "Set breakpoint" },
          { "<localleader>t", desc = "List threads" },
          { "<localleader>?", desc = "Quick reference" },
        },
      },
    },
  },
}
