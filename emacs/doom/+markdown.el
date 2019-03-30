;;; ~/.dotfiles/emacs/doom/+markdown.el -*- lexical-binding: t; -*-

(map! :map markdown-mode-map
      :localleader
      :desc "Blockquote region (or insert)"       "q" #'markdown-insert-blockquote
      :desc "Make region code (or insert)"        "c" #'markdown-insert-code
      )
