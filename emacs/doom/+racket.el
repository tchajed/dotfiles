;;; ~/.dotfiles/emacs/doom/+racket.el -*- lexical-binding: t; -*-

(add-hook! racket-mode
  (quail-define-package "pollen" "UTF-8" "◊" t)
  (quail-define-rules
   ("``" ?◊)
   ("\\cmd" ?◊))

  (defun insert-command-char ()
    "Inserts the command character ◊"
    (interactive)
    (insert ?◊))
  ;; Bind key to M-\ a la DrRacket for lambda
  (global-set-key "\M-\\" 'insert-command-char)
  )
