(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-auto-local ".auctex-auto")
 '(company-coq-disabled-features (quote (outline error-diffs)))
 '(coq-compiler "/Users/tchajed/code/sw/coq/bin/coqc")
 '(coq-dependency-analyzer "/Users/tchajed/code/sw/coq/bin/coqdep")
 '(coq-prefer-top-of-conclusion t)
 '(coq-prog-name "/Users/tchajed/code/sw/coq/bin/coqtop")
 '(evil-want-Y-yank-to-eol nil)
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
    (yasnippet-snippets tide string-inflection pyvenv proof-general pipenv org-bullets org-brain lsp-javascript-typescript live-py-mode json-mode hl-todo helm-projectile godoctor fstar-mode evil-nerd-commenter counsel-projectile counsel swiper ivy smartparens helm helm-core projectile magit git-commit ghub flycheck company js2-mode use-package evil org-plus-contrib yapfify yaml-mode ws-butler with-editor winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen utop undo-tree typescript-mode tuareg toml-mode toc-org tagedit symon spaceline-all-the-icons smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe restart-emacs rbenv rake rainbow-delimiters racer quick-peek pytest pyenv-mode py-isort pug-mode psci psc-ide popwin pippel pip-requirements persp-mode password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download open-junk-file ocp-indent neotree nameless move-text mmm-mode minitest merlin markdown-toc magit-svn magit-gitflow macrostep lsp-ui lsp-python lorem-ipsum livid-mode link-hint less-css-mode json-snatcher json-reformat json-navigator js2-refactor js-doc intero indent-guide importmagic impatient-mode idris-mode hungry-delete hlint-refactor hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-mode-manager helm-make helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets goto-chg google-translate golden-ratio go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy fsharp-mode font-lock+ flycheck-rust flycheck-pos-tip flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-cleverparens evil-args evil-anzu eval-sexp-fu emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode diminish diff-hl define-word dante cython-mode company-web company-tern company-statistics company-lua company-lsp company-go company-ghci company-ghc company-coq company-cabal company-auctex company-anaconda column-enforce-mode cmm-mode clean-aindent-mode chruby centered-cursor-mode cargo bundler browse-at-remote bind-key auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(proof-shrink-windows-tofit t)
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(racer-rust-src-path nil)
 '(rust-indent-offset 2)
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
