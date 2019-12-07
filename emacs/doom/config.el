;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; imported from customize

(setq custom-safe-themes
     '("6cbf6003e137485fb3f904e76fb15bc48abc386540f43f54e2a47a9884e679f6" default))
(setq comment-multi-line t)
(setq font-latex-match-type-command-keywords '(("tej" "{") ("joe" "{") ("todo" "{")))
(setq font-latex-user-keyword-classes
      '(("note"
         (("note" "{"))
         font-lock-keyword-face command)))
(setq proof-prog-name-guess nil)
(setq which-key-idle-delay 0.7)
(load-theme 'doom-one-light)

(doom-load-envvars-file "/Users/tchajed/.emacs.d/.local/env")

;(setq doom-font (font-spec :family "Inconsolata Nerd Font Mono" :size 18))
;(setq doom-big-font (font-spec :family "Inconsolata Nerd Font Mono" :size 24))
(setq doom-font (font-spec :family "Victor Mono" :size 18))
(setq doom-big-font (font-spec :family "Victor Mono" :size 24))
(setq frame-title-format
    '(""
      "%b"
      (:eval
       (let ((project-name (projectile-project-name)))
         (unless (string= "-" project-name)
           (format " in [%s]" project-name))))
      " - Doom Emacs"))

(setq +lookup-provider-url-alist
      '(("Google"            . "https://google.com/search?q=%s")
        ("Google images"     . "https://www.google.com/search?tbm=isch&q=%s")
        ("GitHub"            . "https://github.com/search?ref=simplesearch&q=%s")
        ("Wolfram alpha"     . "https://wolframalpha.com/input/?i=%s")
        ("Wikipedia"         . "https://wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"))
      )

(defcustom frame-writing-width 110
  "Frame width for writing text, in text columns"
  :type '(integer))

(defun setup-frame-for-writing ()
  "Set frame width for writing text."
  (interactive)
  (set-frame-width (selected-frame) frame-writing-width))

;; force menu bar mode back on
(menu-bar-mode)

(setq python-shell-interpreter "python3"
      flycheck-python-pycompile-executable "python3")

(setq +format-on-save-enabled-modes
  '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
        sql-mode         ; sqlformat is currently broken
        latex-mode))

;; the flycheck coq checker is implemented by flycheck and compiles separately
;; (without using the Proof General coqtop), which doesn't make sense for any
;; real Coq project
(setq flycheck-disabled-checkers '(coq))

(load! "+coq.el")
(load! "+markdown.el")
(load! "+bindings.el")
(load! "+latex.el")
(load! "+racket.el")
