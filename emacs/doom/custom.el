;;; .local/custom.el -*- lexical-binding: t; -*-


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#fafafa" "#e45649" "#50a14f" "#986801" "#4078f2" "#a626a4" "#0184bc" "#383a42"])
 '(coq-one-command-per-line nil nil nil "With electric terminator, do not add a newline after advancing proof (since Coq doesn't add the correct indentation).")
 '(custom-enabled-themes (quote (doom-one-light)))
 '(custom-safe-themes
   (quote
    ("5a8dbec3352b4fa1d38f18fd209d6a95f38cabde10fee375a67633bf2066a6d8" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "03d97ba26f176d258777c1f6363822a51562c17205e1eccd310901133b27f0a2" "a2aa9826c2a17f59efe3da9762bdf6fc35edafcf2e2b0f2f925a65fdf9f6abdc" "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad" default)))
 '(fci-rule-color "#383a42")
 '(font-latex-match-type-command-keywords (quote (("tej" "{") ("joe" "{") ("todo" "{"))))
 '(font-latex-user-keyword-classes
   (quote
    (("note"
      (("note" "{"))
      font-lock-keyword-face command))))
 '(frame-writing-width 100)
 '(jdee-db-active-breakpoint-face-colors (cons "#f0f0f0" "#4078f2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#f0f0f0" "#50a14f"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#f0f0f0" "#9ca0a4"))
 '(preview-auto-cache-preamble t)
 '(preview-default-preamble
   '("\\RequirePackage["
     ("," . preview-default-option-list)
     "]{preview}[2004/11/05]" "\\PreviewMacro[{}]{\\sys}"))
 '(proof-prog-name-guess nil)
 '(safe-local-variable-values
   (quote
    ((projectile-project-type . "'make")
     (projectile-project-type . "make")
     (projectile-project-type make)
     (projectile-project-type quote make))))
 '(vc-annotate-background "#fafafa")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50a14f")
    (cons 40 "#688e35")
    (cons 60 "#807b1b")
    (cons 80 "#986801")
    (cons 100 "#ae7118")
    (cons 120 "#c37b30")
    (cons 140 "#da8548")
    (cons 160 "#c86566")
    (cons 180 "#b74585")
    (cons 200 "#a626a4")
    (cons 220 "#ba3685")
    (cons 240 "#cf4667")
    (cons 260 "#e45649")
    (cons 280 "#d2685f")
    (cons 300 "#c07b76")
    (cons 320 "#ae8d8d")
    (cons 340 "#383a42")
    (cons 360 "#383a42")))
 '(vc-annotate-very-old-color nil)
 '(which-key-idle-delay 0.7))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
