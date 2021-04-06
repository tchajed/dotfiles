;;; ../code/dotfiles/emacs/doom/+boogie.el -*- lexical-binding: t; -*-

;(setq dafny-dir (file-name-as-directory "/Users/tchajed/.vscode/extensions/correctnesslab.dafny-vscode-0.19.0/dafny/dafny"))
;; for Dafny 3.0.0
(setq dafny-dir (file-name-as-directory "/Users/tchajed/dafny-bin"))


(setq flycheck-dafny-executable (concat dafny-dir "dafny"))
(setq flycheck-boogie-executable "/Users/tchajed/.dotnet/tools/boogie")
(setq flycheck-z3-smt2-executable (concat dafny-dir "z3/bin/z3"))
(setq flycheck-inferior-dafny-executable (concat dafny-dir "DafnyServer")) ;; Optional
;(setq boogie-friends-profile-analyzer-executable "PATH-TO-Z3-AXIOM-PROFILER") ;; Optional
(setq dafny-verification-backend 'server)
(add-hook 'dafny-mode-hook
          (lambda ()
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)
            (set-fontset-font t 'unicode (font-spec :name "Arial Unicode MS") nil 'append)
            (set-fontset-font t (cons ?∙ ?∙) "Arial Unicode MS" nil 'prepend)
            ))
