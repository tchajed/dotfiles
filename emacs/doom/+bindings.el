;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map! :leader
      (:prefix ("c" . "code")
        :desc "Recompile"                "r"   #'recompile
        :desc "Kill compilation"         "k"   #'kill-compilation)

      (:prefix ("p" . "project")
        :desc "Search project with rg"   "/" #'+ivy/rg
        :desc "Find file in project"     "f" #'projectile-find-file)

      (:prefix ("z" . "zoom")
        :desc "Zoom frame in"          "+" #'zoom-frm-in
        :desc "Zoom frame in"          "=" #'zoom-frm-in
        :desc "Zoom frame out"         "-" #'zoom-frm-out
        :desc "Zoom frame reset"       "0" #'zoom-frm-unzoom)
      )

;; reverse these two bindings since creating frames is more common
(map! "s-n" #'make-frame)
(map! "s-N" #'+default/new-buffer)
