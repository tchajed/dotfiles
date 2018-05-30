(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-coq-disabled-features (quote (outline error-diffs)))
 '(coq-compiler "/Users/tchajed/code/sw/coq/bin/coqc")
 '(coq-dependency-analyzer "/Users/tchajed/code/sw/coq/bin/coqc")
 '(coq-prefer-top-of-conclusion t)
 '(coq-prog-name "/Users/tchajed/code/sw/coq/bin/coqtop")
 '(evil-want-abbrev-expand-on-insert-exit nil)
 '(explicit-shell-file-name "bash")
 '(flycheck-rust-cargo-executable "/Users/tchajed/.cargo/bin/cargo")
 '(flycheck-rust-executable "/Users/tchajed/.cargo/bin/rustc")
 '(font-latex-match-type-command-keywords (quote (("todo" "[{"))))
 '(font-latex-user-keyword-classes
   (quote
    (("note"
      (("note" "[{"))
      font-lock-keyword-face command))))
 '(fstar-executable "/Users/tchajed/code/sw/everest/FStar/bin/fstar.exe")
 '(gofmt-command "goimports")
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (web-mode tuareg tide typescript-mode string-inflection pyvenv pug-mode psc-ide proof-general org-brain link-hint intero importmagic impatient-mode hl-todo hindent helm-xref helm-projectile godoctor fstar-mode fsharp-mode company-quickhelp eyebrowse evil-matchit evil-magit eval-sexp-fu emmet-mode editorconfig dumb-jump define-word dante counsel-projectile counsel ivy cargo auto-yasnippet avy anaconda-mode smartparens flycheck window-purpose helm helm-core skewer-mode js2-mode simple-httpd markdown-mode projectile magit magit-popup pythonic inf-ruby spaceline yasnippet which-key evil async org-plus-contrib hydra bind-key yasnippet-snippets yapfify yaml-mode ws-butler winum web-beautify volatile-highlights vi-tilde-fringe uuidgen utop use-package undo-tree toml-mode toc-org tagedit symon swiper spaceline-all-the-icons smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe restart-emacs rbenv rake rainbow-delimiters racer pytest pyenv-mode py-isort psci powerline popwin pippel pipenv pip-requirements persp-mode password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file ocp-indent neotree nameless move-text mmm-mode minitest merlin markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative less-css-mode lcr json-mode js2-refactor js-doc indent-guide imenu-list idris-mode hy-mode hungry-delete htmlize hlint-refactor highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-purpose helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets goto-chg google-translate golden-ratio go-tag go-rename go-guru go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ ghub gh-md fuzzy font-lock+ flycheck-rust flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-mc evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu epc elisp-slime-nav diminish diff-hl cython-mode company-web company-tern company-statistics company-lua company-go company-ghci company-ghc company-coq company-cabal company-auctex company-anaconda column-enforce-mode coffee-mode cmm-mode clean-aindent-mode chruby centered-cursor-mode caml bundler browse-at-remote auto-highlight-symbol auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(proof-shrink-windows-tofit t)
 '(racer-rust-src-path nil)
 '(safe-local-variable-values
   (quote
    ((coq-prog-args "-emacs" "-R" "." "POCS" "-top" "simpl_anomaly")
     (buffer-file-coding-system . utf-8-unix)
     (coq-prog-args "-noinit")
     (eval let
           ((default-directory
              (locate-dominating-file buffer-file-name ".dir-locals.el")))
           (setq-local coq-prog-args
                       (\`
                        ("-coqlib"
                         (\,
                          (expand-file-name ".."))
                         "-R"
                         (\,
                          (expand-file-name "."))
                         "Coq")))
           (setq-local coq-prog-name
                       (expand-file-name "../bin/coqtop")))
     (eval progn
           (let
               ((plzoo-root-directory
                 (when buffer-file-name
                   (locate-dominating-file buffer-file-name ".dir-locals.el")))
                (plzoo-project-find-file
                 (and
                  (boundp
                   (quote plzoo-project-find-file))
                  plzoo-project-find-file)))
             (when plzoo-root-directory
               (setq tags-file-name
                     (concat plzoo-root-directory "TAGS"))
               (add-to-list
                (quote compilation-search-path)
                plzoo-root-directory)
               (if
                   (not plzoo-project-find-file)
                   (setq compile-command
                         (concat "make -C " plzoo-root-directory))))
             (setq plzoo-executable
                   (concat plzoo-root-directory "all"))))
     (company-coq-local-symbols
      ("Sigma" . 931)
      ("sigma" . 963)
      ("sigma'" 963
       (Br . Bl)
       39))
     (c-file-offsets
      (block-close . 0)
      (brace-list-close . 0)
      (brace-list-entry . 0)
      (brace-list-intro . +)
      (case-label . 0)
      (class-close . 0)
      (defun-block-intro . +)
      (defun-close . 0)
      (defun-open . 0)
      (else-clause . 0)
      (inclass . +)
      (label . 0)
      (statement . 0)
      (statement-block-intro . +)
      (statement-case-intro . +)
      (statement-cont . +)
      (substatement . +)
      (topmost-intro . 0))
     (coq-prog-args "-emacs" "-noinit")
     (compval-coq-local-symbols
      ("Sigma" . 931)
      ("sigma" . 963)
      ("sigma'" 963
       (Br . Bl)
       39))
     (eval progn
           (let
               ((coq-root-directory
                 (when buffer-file-name
                   (locate-dominating-file buffer-file-name ".dir-locals.el")))
                (coq-project-find-file
                 (and
                  (boundp
                   (quote coq-project-find-file))
                  coq-project-find-file)))
             (set
              (make-local-variable
               (quote tags-file-name))
              (concat coq-root-directory "TAGS"))
             (setq camldebug-command-name
                   (concat coq-root-directory "dev/ocamldebug-coq"))
             (unless coq-project-find-file
               (set
                (make-local-variable
                 (quote compile-command))
                (concat "make -C " coq-root-directory))
               (set
                (make-local-variable
                 (quote compilation-search-path))
                (cons coq-root-directory nil)))
             (when coq-project-find-file
               (setq default-directory coq-root-directory))))
     (reftex-default-bibliography "n.bib" "p.bib"))))
 '(search-invisible t)
 '(sh-basic-offset 2)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
