;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; imported from customize

(setq custom-safe-themes
      '(
        "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e"
        "9f297216c88ca3f47e5f10f8bd884ab24ac5bc9d884f0f23589b0a46a608fe14"
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
(setq projectile-sort-order 'recently-active)
(setq safe-local-variable-values '((reftex-default-bibliography "n.bib" "p.bib")))
(setq font-lock-type-face '((t (:foreground "#986801"))))
(setq company-coq-disabled-features '(hello prettify-symbols alerts spinner company-defaults))
(setq dtrt-indent-max-lines 800)

;; TODO: this doesn't seem to have worked (for getting sorted results)
(vertico-multiform-mode)
(setq vertico-multiform-commands
      '((describe-symbol (vertico-sort-function . vertico-sort-alpha))))
(setq vertico-multiform-categories
      '((file (vertico-sort-function . sort-directories-first))))
(defun sort-directories-first (files)
  (setq files (vertico-sort-history-length-alpha files))
  (nconc (seq-filter (lambda (x) (string-suffix-p "/" x)) files)
         (seq-remove (lambda (x) (string-suffix-p "/" x)) files)))

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
(setq font-name "Victor Mono")
;;(setq font-name "Fira Code")
(setq doom-font (font-spec :family font-name :size 16
                           :slant 'normal :weight 'normal))
(setq doom-big-font (font-spec :family font-name :size 20
                               :slant 'normal :weight 'normal))

;; TODO: replace ● and ◯ in Victor Mono with Fira Code *)

;; replaces Apple Color Emoji with a font that has black-and-white symbols
(setq doom-symbol-font (font-spec :family "Symbola"))
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

(setq flycheck-disabled-checkers
      '(
        ;; the flycheck coq checker is implemented by flycheck and compiles separately
        ;; (without using the Proof General coqtop), which doesn't make sense for any
        ;; real Coq project
        coq
        ;; the LaTeX flycheck checker has many false positives and does not
        ;; really catch any bugs
        latex))

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
(load! "+ivy.el")

(add-load-path! "lisp")
;; (require 'avoidwe-mode)

;; use auto-fill-mode by default for writing
(add-hook 'LaTeX-mode-hook #'auto-fill-mode)
(add-hook 'markdown-mode-hook #'auto-fill-mode)

;; from https://emacsredux.com/blog/2020/07/18/automatically-kill-running-processes-on-exit/
;; comes up with background Coq processes
(setq confirm-kill-processes nil)

(setq enable-local-variables t)

(after! lsp
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "clangd")
                    :major-modes '(c-mode c++-mode objc-mode)
                    :remote? t
                    :server-id 'clangd)))

(use-package! verus-mode
  :init
  ;; Path to where you've cloned https://github.com/verus-lang/verus
  (setq verus-home (expand-file-name "~/sw/verus")))
