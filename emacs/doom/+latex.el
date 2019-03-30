;;; ~/.dotfiles/emacs/doom/+latex.el -*- lexical-binding: t; -*-

(map! :map LaTeX-mode-map
      :localleader
      :prefix ("p" . "Preview")
      :desc "Preview Buffer"     "b" #'preview-buffer
      :desc "Clear previews"     "c" #'preview-clearout)
