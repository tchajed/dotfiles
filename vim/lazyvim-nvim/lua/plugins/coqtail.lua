return {
  {
    "whonore/Coqtail",
    ft = { "coq" },
    event = "VeryLazy",
    load = function()
      vim.cmd([[
      augroup CoqtailHighlight
      autocmd!
      autocmd ColorScheme *
      \ hi def CoqtailChecked guibg=NvimLightGray1
      \| hi def CoqtailSent guibg=NvimLightGray3
      augroup END
      ]])
    end,
    config = function()
      -- disable mapping leader key in insert mode. it slows down leader keypress.
      vim.g.coqtail_noimap = 1
      -- Auto-indenting is buggy.
      -- E.g., writing "foo-bar" will trigger an indent bc of faulty "dash" interp.
      vim.g.coqtail_noindent = 1
      -- Iris has a dune config, but it's buggy, so default to CoqProject.
      vim.g.coqtail_build_system = "prefer-coqproject"
      vim.cmd([[
      augroup CoqtailHighlight
        autocmd!
        autocmd ColorScheme *
          \ hi def CoqtailChecked guibg=NvimLightGray1
          \| hi def CoqtailSent guibg=NvimLightGray3
      augroup END
      ]])

      -- Plugin: latex-unicoder.vim (tex unicode).
      -- Note: Std Latex symbs already exist in the package.
      local iris = {}
      iris["fun"] = "λ"
      iris["mult"] = "⋅"
      iris["ent"] = "⊢"
      iris["valid"] = "✓"
      iris["diamond"] = "◇"
      iris["box"] = "□"
      iris["bbox"] = "■"
      iris["later"] = "▷"
      iris["pred"] = "φ"
      iris["and"] = "∧"
      iris["or"] = "∨"
      iris["comp"] = "∘"
      iris["ccomp"] = "◎"
      iris["all"] = "∀"
      iris["ex"] = "∃"
      iris["sep"] = "∗"
      iris["lc"] = "⌜"
      iris["rc"] = "⌝"
      iris["Lc"] = "⎡"
      iris["Rc"] = "⎤"
      iris["lam"] = "λ"
      iris["empty"] = "∅"
      iris["Lam"] = "Λ"
      iris["Sig"] = "Σ"
      iris["-"] = "∖"
      iris["aa"] = "●"
      iris["af"] = "◯"
      iris["auth"] = "●"
      iris["frag"] = "◯"
      iris["gname"] = "γ"
      iris["incl"] = "≼"
      iris["latert"] = "▶"
      iris["update"] = "⇝"
      iris["'o"] = "ö"
      iris["_a"] = "ₐ"
      iris["_e"] = "ₑ"
      iris["_h"] = "ₕ"
      iris["_i"] = "ᵢ"
      iris["_k"] = "ₖ"
      iris["_l"] = "ₗ"
      iris["_m"] = "ₘ"
      iris["_n"] = "ₙ"
      iris["_o"] = "ₒ"
      iris["_p"] = "ₚ"
      iris["_r"] = "ᵣ"
      iris["_s"] = "ₛ"
      iris["_t"] = "ₜ"
      iris["_u"] = "ᵤ"
      iris["_v"] = "ᵥ"
      iris["_x"] = "ₓ"
      iris[":"] = "∷"
      iris["not"] = "¬"
      iris["->"] = "→"
      iris["<->"] = "↔"
      iris["<-"] = "←"
      iris["\\notequiv"] = "≢"
      iris["equiv"] = "⊣⊢"
      iris["in"] = "↪"
      iris["cred"] = "£"
      iris["wand"] = "-∗"
      vim.g.unicode_map = iris
    end,
  },
}
