;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)
(package! default-text-scale)
(package! math-symbol-lists)
(package! frame-fns :recipe (:host github :repo "emacsmirror/frame-fns"))
(package! frame-cmds :recipe (:host github :repo "emacsmirror/frame-cmds"))
(package! zoom-frm :recipe (:host github :repo "emacsmirror/zoom-frm"))
(package! boogie-friends)
(package! gnuplot :recipe (:host github :repo "emacsorphanage/gnuplot"))
(package! shfmt)
(package! bats-mode)
(package! sed-mode)
(package! hotcrp-mode :recipe (:host github :repo "adamdoupe/hotcrp-mode-el"))
(package! verus-mode
  :recipe (:host github :repo "verus-lang/verus-mode.el"))
