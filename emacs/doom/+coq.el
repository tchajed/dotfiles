;;; ~/.doom.d/+coq.el -*- lexical-binding: nil; -*-
;;;

;; workaround for https://github.com/ProofGeneral/PG/issues/781
(add-hook 'coq-shell-mode-hook (lambda () (setq proof-shell-strip-crs-from-input t)))
(add-hook! coq-mode
  (setq proof-splash-enable nil)
  (setq proof-splash-seen t)

  (evil-define-text-object evil-a-lift (count &optional beg end type)
    "Select a lifted proposition (delimited by ⌜⌝)."
    :extend-selection nil
    (evil-select-paren ?⌜ ?⌝ beg end type count t))

  (evil-define-text-object evil-inner-lift (count &optional beg end type)
    "Select inner lifted proposition."
    :extend-selection nil
    (evil-select-paren ?⌜ ?⌝ beg end type count))

  (define-key evil-inner-text-objects-map "l" 'evil-inner-lift)
  (define-key evil-outer-text-objects-map "l" 'evil-a-lift)

  (setq company-coq-prettify-symbols-alist '(;; Disabled
                                             ("*" . ?×)  ; Inconsistent (‘intros H *’, rewrite in *, etc.)
                                             ;; ("~" . ?¬)  ; Too invasive
                                             ;; ("+-" . ?±) ; Too uncommon
                                             ;; ("++" . ?⧺) ; Not present in TeX fonts
                                             ;; ("nat" . ?𝓝) ("Prop" . ?𝓟) ; Rather uncommon
                                             ;; ("N" . ?ℕ) ("Z" . ?ℤ) ("Q" . ?ℚ) ; Too invasive

                                             ;; Core Coq symbols
                                             ("|-" . ?⊢) ("||" . ?‖) ("/\\" . ?∧) ("\\/" . ?∨)
                                             ("->" . ?→) ("<-" . ?←) ("<->" . ?↔) ("=>" . ?⇒)
                                             ("<=" . ?≤) (">=" . ?≥) ("<>" . ?≠)
                                             ;; ("True" . ?⊤) ("False" . ?⊥)
                                             ;; ("fun" . ?λ) ("forall" . ?∀) ("exists" . ?∃)
                                             ;; ("Prop" . ?ℙ)
                                             ;; ("nat" . ?ℕ) ("Prop" . ?ℙ) ("Real" . ?ℝ) ("bool" . ?𝔹)

                                             ;; Extra symbols
                                             (">->" . ?↣)
                                             ("-->" . ?⟶) ("<--" . ?⟵) ("<-->" . ?⟷)
                                             ("==>" . ?⟹) ("<==" . ?⟸) ("~~>" . ?⟿) ("<~~" . ?⬳)

                                             ;; Iris
                                             ("◯" . ?○)
                                             ))

  ;; auto-indentation in Coq isn't good enough to use electric indentation
  (electric-indent-mode -1))

(when (modulep! :config default +smartparens)
  (after! smartparens
    (sp-with-modes '(coq-mode)
      (sp-local-pair "(*" "*)")
      (sp-local-pair "(*" "*"
                                        ;:actions '(insert)
                     :post-handlers '(("| " "SPC") ("|\n[i]*[d-2]" "RET")))
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

  ;; https://emacs.stackexchange.com/questions/76725/how-to-implement-a-function-in-quail-define-rules-for-set-input-method
  (defun quail-action-f (key idx)    ; key=keyword, idx=length
    (quail-delete-region)                 ; these lines apparently needed
    (setq quail-current-str nil           ; to remove key.
          quail-converting nil            ; (not sure why all 4 is needed)
          quail-conversion-str "")        ;


    (insert "⟨⟩")
    (forward-char -1)

    (throw 'quail-tag nil)                ; this is need for finishing up?
    )

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
   ("\\neq"            "≠")
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
   ("\\bient"          ["⊣⊢"])
   ("\\Vdash"          "⊨")
   ("\\infty"          "∞")
   ("\\comp"           "∘")
   ("\\prf"            "↾")
   ("\\bind"           ["≫="])
   ("\\mapsto"         "↦")
   ("\\hookrightarrow" "↪")
   ("\\uparrow"        "↑")
   ("\\upclose"        "↑")

   ;; Perennial
   ("\\named"           "∷")

   ;; Diaframe
   ("\\Hint"           ?✱)
   ("\\Entails"        ?⊫)

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
   ("\\frag"   ?○)
   ("\\iff"    ?↔)
   ("\\gname"  ?γ)
   ("\\incl"   ?≼)
   ("\\latert" ?▶)

   ;; accents (for iLöb)
   ("\\\"o"    ?ö)
   ("\\Lob"    ?ö)

   ;; subscripts and superscripts
   ("^^+" ?⁺) ("__+" ?₊) ("^^-" ?⁻)
   ("^go" ["ᵍᵒ"])
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
   ("\\gets"     ?←)
   ("\\op"       ?⋅)
   ("\\except0"  ?◇)
   ;; note that this is a elisp vector - quail interprets a string as a list of
   ;; characters that are candidates for translation, while a vector can contain
   ;; strings that are candidates for translation.
   ("\\bient"    ["⊣⊢"])
   ("\\wand"    ["-∗"])
   ("\\equiv"   ["≡"])
   ;; ("\\equivP"   ["≡ₚ"])
   ;; common typo due to keyboard config
   ("\\_ep"    ?∗)

   ("\\always"      ?□)
   ("\\eventually"  ?◇)
   ;;("\\action"      ["⟨⟩"])
   ("\\action"      quail-action-f)
   ("\\next"      ["□⟨next⟩"])
   )
  ;; use the newly-created math input method
  (set-input-method "math")
  )

(add-hook! coq-mode
  (setq proof-three-window-mode-policy 'hybrid)
  ;;(setq undo-tree-enable-undo-in-region nil)

  ;;(setq coq-compiler "coqc")
  ;;(setq coq-dependency-analyzer "coqdep")
  ;;(setq coq-prog-name "coqtop")
  ;;(let ((coqbin (getenv "COQBIN")))
  ;;  (setq coq-compiler (concat coqbin "coqc"))
  ;;  (setq coq-dependency-analyzer (concat coqbin "coqdep"))
  ;;  (setq coq-prog-name (concat coqbin "coqtop")))
  (setq coq-prefer-top-of-conclusion t)
  (setq proof-electric-terminator-enable nil)
  (setq coq-double-hit-enable nil)
  (setq company-coq-live-on-the-edge t)

  (setq company-coq-disabled-features
        '(hello
          ;; outline
          refactorings
          alerts ;; doesn't work on macOS
          prettify-symbols ;; causes too many problems with Iris
          spinner ;; not useful, causes huge performance problems; hidden anyway
          obsolete-settings))

  (setq require-final-newline t)

  (iris-input-config)

  ;; fix indentation of these connectives, by mapping them to the indentation of
  ;; other symbols
  ;;
  ;; see https://gitlab.mpi-sws.org/iris/iris/-/blob/master/docs/editor.md#automated-indentation
  (setq coq-smie-user-tokens
        '(("-∗" . "->")
          ("∗-∗" . "<->")
          ("==∗" . "->")
          ("⊢" . "->")
          ("⊣⊢" . "<->")
          ("⋅" . "*")
          (":>" . ":=")
          ("by" . "now")
          ("forall" . "now")))
  )

(with-eval-after-load 'treemacs

  (defun treemacs-ignore-coq (filename absolute-path)
    (or (string-equal ".lia.cache"  filename)
        (string-equal ".nia.cache"  filename)
        (string-equal ".coqdeps.d"  filename)
        (string-suffix-p ".vo"   filename)
        (string-suffix-p ".vos"  filename)
        (string-suffix-p ".vok"  filename)
        (string-suffix-p ".aux"  filename)
        (string-suffix-p ".glob" filename)))

  (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-coq))


;; fix company-coq loading, from https://github.com/hlissner/doom-emacs/pull/2857
;;
;; `+company-init-backends-h' in `after-change-major-mode-hook' overrides
;; `company-backends' set by `company-coq' package. This dirty hack fixes
;; completion in coq-mode. TODO: remove when company backends builder is
;; reworked.
(defvar-local +coq--company-backends nil)
(after! company-coq
  (defun +coq--record-company-backends-h ()
    (setq +coq--company-backends company-backends))
  (defun +coq--replay-company-backends-h ()
    (setq company-backends +coq--company-backends))
  (add-hook! 'company-coq-mode-hook
    (defun +coq--fix-company-coq-hack-h ()
      (add-hook! 'after-change-major-mode-hook :local #'+coq--record-company-backends-h)
      (add-hook! 'after-change-major-mode-hook :append :local #'+coq--replay-company-backends-h))))


(after! coq-mode
  (load-file "~/code/perennial/etc/mixcode/mixcode.el"))
(add-hook! coq-mode (mixcode-mode))

(add-hook! coq-mode
  (map! :map coq-mode-map
        :localleader
        :prefix ("m" . "Mixcode")
        :desc "Load Go file"            "l" #'mixcode-load-file
        :desc "Insert code"             "m" #'mixcode-insert-code
        :desc "Insert wp"               "w" #'mixcode-insert-wp
        )
  (map! :map coq-mode-map
        :localleader
        :prefix ("l" . "Mixcode")
        :desc "Load Go file"            "l" #'mixcode-load-file
        :desc "Insert wp"               "w" #'mixcode-insert-wp
        )
  )
