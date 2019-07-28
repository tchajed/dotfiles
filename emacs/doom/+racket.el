;;; ~/.dotfiles/emacs/doom/+racket.el -*- lexical-binding: t; -*-

(map! :map racket-mode-map
      :i "[" #'racket-smart-open-bracket
      :map racket-repl-mode-map
      :i "[" #'racket-smart-open-bracket)
