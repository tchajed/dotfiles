;;; ~/.dotfiles/emacs/doom/+markdown.el -*- lexical-binding: t; -*-

(map! :map markdown-mode-map
      :localleader
      :desc "Blockquote region (or insert)"       "q" #'markdown-insert-blockquote
      :desc "Make region code (or insert)"        "c" #'markdown-insert-code
      )
(add-hook 'markdown-mode-hook #'visual-line-mode)
(after! markdown-mode
  (custom-set-faces!
    '(markdown-header-face-1 :height 1.8 :weight bold :inherit markdown-header-face)
    '(markdown-header-face-2 :height 1.5 :weight bold :inherit markdown-header-face)
    '(markdown-header-face-3 :height 1.3 :weight semi-bold :inherit markdown-header-face)
    '(markdown-header-face-4 :height 1.1 :weight semi-bold :inherit markdown-header-face)
    '(markdown-header-face-5 :height 1.0 :weight normal :inherit markdown-header-face)
    '(markdown-header-face-6 :height 0.9 :weight normal :inherit markdown-header-face)))
