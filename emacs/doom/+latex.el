;;; ~/.dotfiles/emacs/doom/+latex.el -*- lexical-binding: t; -*-

(defun my/tex-font-bold ()
  (interactive)
  (TeX-font nil ?\C-b))
(defun my/tex-font-emph ()
  (interactive)
  (TeX-font nil ?\C-e))
(defun my/tex-font-tt ()
  (interactive)
  (TeX-font nil ?\C-t))

(map! :map LaTeX-mode-map
      :localleader
      (:prefix ("p" . "Preview")
       :desc "Preview Buffer"     "b" #'preview-buffer
       :desc "Clear previews"     "c" #'preview-clearout)
      (:prefix ("h" . "Hide markup")
       :desc "Fold markup" "h" #'TeX-fold-buffer
       :desc "Show markup" "H" #'TeX-fold-clearout-buffer)
      ;; TODO: using t because I can't figure out how to override existing f prefix
      (:prefix ("t" . "Formatting")
       :nv :desc "bold" "b"   #'my/tex-font-bold
       :nv :desc "emph" "e"   #'my/tex-font-emph
       :nv :desc "tt"   "t"   #'my/tex-font-tt)
      )
