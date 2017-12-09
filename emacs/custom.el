(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-abbrev-expand-on-insert-exit nil)
 '(font-latex-match-type-command-keywords (quote (("todo" "[{"))))
 '(font-latex-user-keyword-classes
   (quote
    (("note"
      (("note" "[{"))
      font-lock-keyword-face command))))
 '(fstar-executable "/Users/tchajed/code/sw/everest/FStar/bin/fstar.exe")
 '(gofmt-command "goimports")
 '(package-selected-packages
   (quote
    (rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby go-guru browse-at-remote async s company-quickhelp diminish f fsharp-mode fstar-mode company-go proof-general go-mode projectile packed smartparens evil helm helm-core avy dash imenu-list coq-mode yapfify yaml-mode web-mode web-beautify utop tuareg caml toml-mode tide typescript-mode tagedit smeargle slim-mode scss-mode sass-mode racer pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements orgit org-projectile org-present org-pomodoro alert log4e gntp org-download ocp-indent mmm-mode merlin markdown-toc markdown-mode magit-gitflow lua-mode livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc intero hy-mode htmlize hlint-refactor hindent helm-pydoc helm-hoogle helm-gitignore helm-css-scss helm-company helm-c-yasnippet haskell-snippets haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flycheck-rust seq flycheck-pos-tip pos-tip flycheck-haskell flycheck evil-magit magit magit-popup git-commit with-editor emmet-mode diff-hl cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-ghci company-ghc ghc haskell-mode company-coq company-math math-symbol-lists company-cabal company-auctex company-anaconda company coffee-mode cmm-mode cargo rust-mode auto-yasnippet yasnippet auctex anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(proof-shrink-windows-tofit t)
 '(racer-rust-src-path nil)
 '(safe-local-variable-values
   (quote
    ((eval progn
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
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )