return {
  "lervag/vimtex",
  lazy = false, -- NEVER lazy-load VimTeX; breaks inverse search
  init = function()
    -- PDF viewer (Zathura recommended; supports SyncTeX)
    vim.g.vimtex_view_method = "zathura"

    -- Compiler: latexmk is the default and recommended
    -- vim.g.vimtex_compiler_method = "latexmk"  -- already default

    -- Disable K mapping so it doesn't conflict with LSP hover
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }

    -- Quickfix log parser (latexlog is the fallback if pplatex isn't installed)
    vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1
      and "pplatex"
      or "latexlog"

    -- Optional: suppress common noisy warnings in quickfix
    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull \\\\hbox",
      "Overfull \\\\hbox",
    }

    -- Folding support
    vim.o.foldmethod = "expr"
    vim.o.foldexpr   = "vimtex#fold#level(v:lnum)"
    vim.o.foldtext   = "vimtex#fold#text()"
    vim.o.foldlevel  = 2

    -- Disable insert mode mappings if you prefer managing them via snippets
    -- vim.g.vimtex_imaps_enabled = 0
  end,
}

