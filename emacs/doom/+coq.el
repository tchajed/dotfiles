;;; ~/.doom.d/+coq.el -*- lexical-binding: nil; -*-
;;;

(add-hook! coq-mode
  (setq proof-splash-enable nil)
  (setq proof-splash-seen t)

  (evil-define-text-object evil-a-lift (count &optional beg end type)
    "Select a lifted proposition."
    :extend-selection nil
    (evil-select-paren ?⌜ ?⌝ beg end type count t))

  (evil-define-text-object evil-inner-lift (count &optional beg end type)
    "Select inner lifted proposition."
    :extend-selection nil
    (evil-select-paren ?⌜ ?⌝ beg end type count))

  (define-key evil-inner-text-objects-map "l" 'evil-inner-lift)
  (define-key evil-outer-text-objects-map "l" 'evil-a-lift)

  (setq company-coq-prettify-symbols-alist '(;; Disabled
                                             ;; ("*" . ?×)  ; Inconsistent (‘intros H *’, rewrite in *, etc.)
                                             ;; ("~" . ?¬)  ; Too invasive
                                             ;; ("+-" . ?±) ; Too uncommon
                                             ;; ("++" . ?⧺) ; Not present in TeX fonts
                                             ;; ("nat" . ?𝓝) ("Prop" . ?𝓟) ; Rather uncommon
                                             ;; ("N" . ?ℕ) ("Z" . ?ℤ) ("Q" . ?ℚ) ; Too invasive

                                             ;; Core Coq symbols
                                             ("|-" . ?⊢) ("||" . ?‖) ("/\\" . ?∧) ("\\/" . ?∨)
                                             ("->" . ?→) ("<-" . ?←) ("<->" . ?↔) ("=>" . ?⇒)
                                             ("<=" . ?≤) (">=" . ?≥) ("<>" . ?≠)
                                             ("True" . ?⊤) ("False" . ?⊥)
                                             ("fun" . ?λ) ("forall" . ?∀) ("exists" . ?∃)
                                             ("Prop" . ?ℙ)
                                             ;; ("nat" . ?ℕ) ("Prop" . ?ℙ) ("Real" . ?ℝ) ("bool" . ?𝔹)

                                             ;; Extra symbols
                                             (">->" . ?↣)
                                             ("-->" . ?⟶) ("<--" . ?⟵) ("<-->" . ?⟷)
                                             ("==>" . ?⟹) ("<==" . ?⟸) ("~~>" . ?⟿) ("<~~" . ?⬳)))

  ;; auto-indentation in Coq isn't good enough to use electric indentation
  (electric-indent-mode -1))

(when (featurep! :config default +smartparens)
  (after! smartparens
    (sp-with-modes '(coq-mode)
      ;; Disable ` because it is used in implicit generalization
      (sp-local-pair "`" nil :actions nil)
      (sp-local-pair "(*" "*)" :actions nil)
      (sp-local-pair "(*" "*"
                     :actions '(insert)
                     :post-handlers '(("| " "SPC") ("|\n[i]*)[d-2]" "RET")))
      )))

(map! :map coq-mode-map
      :ni "<f3>" #'proof-assert-next-command-interactive
      :ni "<f4>" #'proof-goto-point
      :ni "<f2>" #'proof-undo-last-successful-command

      :localleader
      :desc "Go to point"                "." #'proof-goto-point

      :prefix ("p" . "Proof process")
      :desc "Kill Coq process"           "x" #'proof-shell-exit
      :desc "Interrupt Coq"              "c" #'proof-interrupt-process
      :desc "Retract proof"              "r" #'proof-retract-buffer
      :desc "Process buffer"             "b" #'proof-process-buffer

      :prefix ("l" . "PG window layout")
      :desc "Re-layout windows"          "l" #'proof-layout-windows
      :desc "Clear response buffer"      "c" #'pg-response-clear-displays
      :desc "Show proof state"           "p" #'proof-prf

      :prefix ("a" . "Query Coq")
      :desc "Check"                      "c" #'coq-Check
      :desc "Print"                      "p" #'coq-Print
      :desc "About"                      "b" #'coq-About
      :desc "Locate Constant"            "l" #'coq-LocateConstant
      :desc "Locate Notation"            "n" #'coq-LocateNotation
      :desc "Search"                     "s" #'coq-SearchConstant

      :prefix ("ai" . "Query Coq with implicits")
      :desc "Check with implicits"       "c" #'coq-Check-show-implicits
      :desc "Print with implicits"       "p" #'coq-Print-with-implicits
      :desc "About with implicits"       "b" #'coq-About-with-implicits
      )

(defun iris-input-config ()
  "Set up math input for Iris.

Based on https://gitlab.mpi-sws.org/iris/iris/blob/master/docs/editor.md"

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
   ;; LaTeX math rules
   ("\\forall"         "∀")
   ("\\exists"         "∃")
   ("\\not"            "¬")
   ;("\\/"              "∨")
   ;("/\\"              "∧")
   ;("->"               "→")
   ;("<->"              "↔")
   ("\\<-"             "←") ;; we add a backslash because the plain <- is used for the rewrite tactic
   ("\\=="             "≡")
   ("\\/=="            "≢")
   ;("/="               "≠")
   ;("<="               "≤")
   ("\\in"             "∈")
   ("\\notin"          "∉")
   ("\\cup"            "∪")
   ("\\cap"            "∩")
   ("\\union"          "∪")
   ("\\intersect"      "∩")
   ("\\setminus"       "∖")
   ("\\subset"         "⊂")
   ("\\subseteq"       "⊆")
   ("\\sqsubseteq"     "⊑")
   ("\\sqsubseteq"     "⊑")
   ("\\notsubseteq"    "⊈")
   ("\\meet"           "⊓")
   ("\\join"           "⊔")
   ("\\top"            "⊤")
   ("\\bottom"         "⊥")
   ("\\vdash"          "⊢")
   ("\\dashv"          "⊣")
   ("\\Vdash"          "⊨")
   ("\\infty"          "∞")
   ("\\comp"           "∘")
   ("\\prf"            "↾")
   ("\\bind"           "≫")
   ("\\mapsto"         "↦")
   ("\\hookrightarrow" "↪")
   ("\\uparrow"        "↑")
   ("\\upclose"        "↑")

   ;; Perennial
   ("\\named"           "∷")

   ("\\mult"   ?⋅)
   ("\\ent"    ?⊢)
   ("\\valid"  ?✓)
   ("\\box"    ?□)
   ("\\later"  ?▷)
   ("\\pred"   ?φ)
   ("\\post"   ?Φ)
   ("\\phi"    ?Φ)
   ("\\and"    ?∧)
   ("\\or"     ?∨)
   ("\\land"   ?∧)
   ("\\lor"    ?∨)
   ("\\comp"   ?∘)
   ("\\ccomp"  ?◎)
   ("\\all"    ?∀)
   ("\\ex"     ?∃)
   ("\\to"     ?→)
   ("\\arr"    ?→)
   ("\\sep"    ?∗)
   ("\\ast"    ?∗)
   ("\\lc"     ?⌜)
   ("\\rc"     ?⌝)
   ("\\lam"    ?λ)
   ("\\fun"    ?λ)
   ("\\empty"  ?∅)
   ("\\Lam"    ?Λ)
   ("\\Sig"    ?Σ)
   ("\\env"    ?Δ)
   ("\\state"  ?σ)
   ("\\-"      ?∖)
   ("\\aa"     ?●)
   ("\\af"     ?◯)
   ("\\iff"    ?↔)
   ("\\gname"  ?γ)
   ("\\incl"   ?≼)
   ("\\latert" ?▶)

   ;; accents (for iLöb)
   ("\\\"o"    ?ö)

   ;; subscripts and superscripts
   ("^^+" ?⁺) ("__+" ?₊) ("^^-" ?⁻)
   ("__0" ?₀) ("__1" ?₁) ("__2" ?₂) ("__3" ?₃) ("__4" ?₄)
   ("__5" ?₅) ("__6" ?₆) ("__7" ?₇) ("__8" ?₈) ("__9" ?₉)

   ("__a" ?ₐ) ("__e" ?ₑ) ("__h" ?ₕ) ("__i" ?ᵢ) ("__k" ?ₖ)
   ("__l" ?ₗ) ("__m" ?ₘ) ("__n" ?ₙ) ("__o" ?ₒ) ("__p" ?ₚ)
   ("__r" ?ᵣ) ("__s" ?ₛ) ("__t" ?ₜ) ("__u" ?ᵤ) ("__v" ?ᵥ) ("__x" ?ₓ)

   ;; Greek alphabet
   ("\\Alpha"    "Α") ("\\alpha"    "α")
   ("\\Beta"     "Β") ("\\beta"     "β")
   ("\\Gamma"    "Γ") ("\\gamma"    "γ")
   ("\\Delta"    "Δ") ("\\delta"    "δ")
   ("\\Epsilon"  "Ε") ("\\epsilon"  "ε")
   ("\\Zeta"     "Ζ") ("\\zeta"     "ζ")
   ("\\Eta"      "Η") ("\\eta"      "η")
   ("\\Theta"    "Θ") ("\\theta"    "θ")
   ("\\Iota"     "Ι") ("\\iota"     "ι")
   ("\\Kappa"    "Κ") ("\\kappa"    "κ")
   ("\\Lamda"    "Λ") ("\\lamda"    "λ")
   ("\\Lambda"   "Λ") ("\\lambda"   "λ")
   ("\\Mu"       "Μ") ("\\mu"       "μ")
   ("\\Nu"       "Ν") ("\\nu"       "ν")
   ("\\Xi"       "Ξ") ("\\xi"       "ξ")
   ("\\Omicron"  "Ο") ("\\omicron"  "ο")
   ("\\Pi"       "Π") ("\\pi"       "π")
   ("\\Rho"      "Ρ") ("\\rho"      "ρ")
   ("\\Sigma"    "Σ") ("\\sigma"    "σ")
   ("\\Tau"      "Τ") ("\\tau"      "τ")
   ("\\Upsilon"  "Υ") ("\\upsilon"  "υ")
   ("\\Phi"      "Φ") ("\\phi"      "φ")
   ("\\Chi"      "Χ") ("\\chi"      "χ")
   ("\\Psi"      "Ψ") ("\\psi"      "ψ")
   ("\\Omega"    "Ω") ("\\omega"    "ω")

   ;; custom
   ("\\gets" ?←)
   )
  ; use the newly-created math input method
  (set-input-method "math")
  )

(add-hook! coq-mode
  (setq proof-three-window-mode-policy 'hybrid)
  (setq undo-tree-enable-undo-in-region nil)

  (let ((coqbin (getenv "COQBIN")))
    (setq coq-compiler (concat coqbin "coqc"))
    (setq coq-dependency-analyzer (concat coqbin "coqdep"))
    (setq coq-prog-name (concat coqbin "coqtop")))
  (setq coq-prefer-top-of-conclusion t)
  (setq proof-electric-terminator-enable nil)
  (setq coq-double-hit-enable nil)
  (setq company-coq-live-on-the-edge t)

  (setq company-coq-disabled-features
        '(hello
          outline
          refactorings
          alerts ;; doesn't work on macOS
          prettify-symbols ;; causes too many problems with Iris
          spinner ;; minor modes are hidden anyway
          obsolete-settings))

  (setq require-final-newline t)

  (iris-input-config)
  )

(with-eval-after-load 'treemacs

  (defun treemacs-ignore-coq (filename absolute-path)
    (or (string-suffix-p ".vo" filename)
        (string-suffix-p ".vos" filename)
        (string-suffix-p ".vok" filename)
        (string-suffix-p ".aux" filename)
        (string-suffix-p ".glob" filename)))

  (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-coq))
