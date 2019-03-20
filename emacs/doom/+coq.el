;;; ~/.doom.d/+coq.el -*- lexical-binding: nil; -*-
;;;
(setq proof-splash-enable nil)
(setq proof-splash-seen t)
(setq company-coq-disabled-features
      '(hello
        outline
        error-diffs
        alerts
        spinner ;; minor modes are hidden anyway
        obsolete-settings))

(defun setup-coq-keys-for-map (state)
  "Add f-key support to evil state STATE."
  (evil-define-key state coq-mode-map
    (kbd "<f3>") #'proof-assert-next-command-interactive)
  (evil-define-key state coq-mode-map
    (kbd "<f4>") #'company-coq-proof-goto-point)
  (evil-define-key state coq-mode-map
    (kbd "<f2>") #'proof-undo-last-successful-command))

(defun iris-input-config ()
  "Set up math input for Iris.

Based on https://gitlab.mpi-sws.org/iris/iris/blob/master/Editor.md"

  (require 'math-symbol-lists)
  ;; Input method for the minibuffer
  (defun my-inherit-input-method ()
    "Inherit input method from `minibuffer-selected-window'."
    (let* ((win (minibuffer-selected-window))
           (buf (and win (window-buffer win))))
      (when buf
        (activate-input-method (buffer-local-value 'current-input-method buf)))))
  (add-hook 'minibuffer-setup-hook #'my-inherit-input-method)
  ;; Define the actual input method
  (quail-define-package "math" "UTF-8" "Ω" t)
  (quail-define-rules ; add whatever extra rules you want to define here...
   ("\\mult"   ?⋅)
   ("\\ent"    ?⊢)
   ("\\valid"  ?✓)
   ("\\box"    ?□)
   ("\\later"  ?▷)
   ("\\pred"   ?φ)
   ("\\and"    ?∧)
   ("\\or"     ?∨)
   ("\\comp"   ?∘)
   ("\\ccomp"  ?◎)
   ("\\all"    ?∀)
   ("\\ex"     ?∃)
   ("\\to"     ?→)
   ("\\sep"    ?∗)
   ("\\lc"     ?⌜)
   ("\\rc"     ?⌝)
   ("\\lam"    ?λ)
   ("\\empty"  ?∅)
   ("\\Lam"    ?Λ)
   ("\\Sig"    ?Σ)
   ("\\-"      ?∖)
   ("\\aa"     ?●)
   ("\\af"     ?◯)
   ("\\iff"    ?↔)
   ("\\gname"  ?γ)
   ("\\incl"   ?≼)
   ("\\latert" ?▶)
   )
  (mapc (lambda (x)
          (if (cddr x)
              (quail-defrule (cadr x) (car (cddr x)))))
        (append math-symbol-list-basic math-symbol-list-extended))
  )

(add-hook! coq-mode
  (setq proof-three-window-mode-policy 'hybrid)

  (let ((coqbin (getenv "COQBIN")))
    (setq coq-compiler (concat coqbin "coqc"))
    (setq coq-dependency-analyzer (concat coqbin "coqdep"))
    (setq coq-prog-name (concat coqbin "coqtop")))
  (setq coq-prefer-top-of-conclusion t)
  (setq proof-electric-terminator-enable nil)
  (setq coq-double-hit-enable t)
  (setq company-coq-live-on-the-edge t)

  (setq require-final-newline t)

  (setup-coq-keys-for-map 'normal)
  (setup-coq-keys-for-map 'insert)
  (iris-input-config)
  )
