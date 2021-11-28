;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; imported from customize

(setq custom-safe-themes
      '(
        "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63"
        "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c"
        "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e"
        "f4876796ef5ee9c82b125a096a590c9891cec31320569fc6ff602ff99ed73dca"
        "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570"
        "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f"
        "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93"
        "6cbf6003e137485fb3f904e76fb15bc48abc386540f43f54e2a47a9884e679f6"
        "63bfcabeb44559c67d8827dc68cd6c4a6d3ce35ef4504343af12d42f24894e00"
        "88f59acbeacefb4998f45126d4d8ae8b2184f2a48753db362a349fd55321c7e1"
        "6c386d159853b0ee6695b45e64f598ed45bd67c47f671f69100817d7db64724d"
        default))
(setq comment-multi-line t)
(setq font-latex-match-type-command-keywords '(("tej" "{") ("joe" "{") ("todo" "{") ("mfk" "{") ("ralf" "{")))
(setq font-latex-user-keyword-classes
      '(("note"
         (("note" "{"))
         font-lock-keyword-face command)))
(setq proof-prog-name-guess nil)
(setq which-key-idle-delay 0.7)
(setq projectile-indexing-method 'hybrid)
(setq safe-local-variable-values '((reftex-default-bibliography "n.bib" "p.bib")))
(setq font-lock-type-face '((t (:foreground "#986801"))))
(setq company-coq-disabled-features '(hello prettify-symbols alerts spinner company-defaults))
(setq dtrt-indent-max-lines 800)

;; use a slightly narrower font for mode line to fit more symbols
(custom-set-faces!
  '(mode-line :family "Inconsolata Nerd Font Mono" :height 1.0)
  '(mode-line-inactive :family "Inconsolata Nerd Font Mono" :height 1.0))

(setq current-theme-phase 'light)
(load-theme 'doom-one-light)

(defun toggle-theme-phase ()
  "Switch between light and dark themes."
  (interactive)
  (if (eq current-theme-phase 'light)
      (progn
        (setq current-theme-phase 'dark)
        (load-theme 'doom-one))
    (progn
      (setq current-theme-phase 'light)
      (load-theme 'doom-one-light))))

(doom-load-envvars-file "/Users/tchajed/.emacs.d/.local/env")

(setq fancy-splash-image "~/Pictures/iris-tan.png")

;;(setq doom-font (font-spec :family "Inconsolata Nerd Font Mono" :size 18))
;;(setq doom-big-font (font-spec :family "Inconsolata Nerd Font Mono" :size 24))
(setq doom-font (font-spec :family "Victor Mono" :size 16
                           :slant 'normal :weight 'normal))
(setq doom-big-font (font-spec :family "Victor Mono" :size 20
                               :slant 'normal :weight 'normal))
;; increase font by small increments
(setq doom-font-increment 1)

;; from https://stackoverflow.com/questions/17362999
;;
;; start Emacs with a reasonably-sized frame (macOS window)
;;; Nice size for the default window
(defun get-default-height ()
       (/ (- (display-pixel-height) 120)
          (frame-char-height)))
(add-to-list 'default-frame-alist '(width . 140))
(add-to-list 'default-frame-alist (cons 'height (get-default-height)))

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
            LaTeX-mode
            latex-mode
            bibtex-mode      ; causes too much disruption
            ))

;; auto-detecting shell language as in
;; https://github.com/hlissner/doom-emacs/issues/2905 doesn't seem to work,
;; force it to be bash
(after! sh-script
  (set-formatter! 'shfmt
    '("shfmt"
      ("-i" "%d" (unless indent-tabs-mode tab-width))
      ("-ln" "%s" "bash"))))

;; the flycheck coq checker is implemented by flycheck and compiles separately
;; (without using the Proof General coqtop), which doesn't make sense for any
;; real Coq project
(setq flycheck-disabled-checkers '(coq))

;; use ~/ to move to home (instead of just ~)
(setq ivy-magic-tilde nil)

;; tab indents anywhere in the line (TODO: probably want this only in only
;; programming language major modes, especially Coq but also any language with
;; reliable auto-indentation)
(setq tab-always-indent t)

;; the regular smie-config-guess takes forever in Coq mode due to some advice
;; added by Doom; replace it with a constant
(defun my-smie-config-guess ()
  (if (equal major-mode 'coq-mode) 2 nil))
(advice-add 'smie-config-guess
            :before-until #'my-smie-config-guess)

(load! "+coq.el")
(load! "+markdown.el")
(load! "+bindings.el")
(load! "+latex.el")
(load! "+racket.el")
(load! "+dafny.el")

;; use auto-fill-mode by default for writing
(add-hook 'LaTeX-mode-hook #'auto-fill-mode)
(add-hook 'markdown-mode-hook #'auto-fill-mode)

;; from https://emacsredux.com/blog/2020/07/18/automatically-kill-running-processes-on-exit/
;; comes up with background Coq processes
(setq confirm-kill-processes nil)

(setq enable-local-variables t)
