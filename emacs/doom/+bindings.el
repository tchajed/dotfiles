;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(map! :leader
      (:prefix "c"
        :desc "Recompile"                "r"   #'recompile
        :desc "Kill compilation"         "k"   #'kill-compilation)

      (:prefix "p"
        :desc "Search project with rg"   "/" #'+ivy/rg
        :desc "Find file in project"     "f" #'projectile-find-file)

      (:prefix ("z" . "zoom")
        :desc "Zoom frame in"          "+" #'zoom-frm-in
        :desc "Zoom frame in"          "=" #'zoom-frm-in
        :desc "Zoom frame out"         "-" #'zoom-frm-out
        :desc "Zoom frame reset"       "0" #'zoom-frm-unzoom)

      (:prefix "t"
        :desc "Toggle light/dark themes"   "t" #'toggle-theme-phase
        ))

;; reverse these two bindings since creating frames is more common
(map! "s-n" #'make-frame)
(map! "s-N" #'+default/new-buffer)

(global-set-key (kbd "s-1") #'delete-other-windows)

;; https://emacs.stackexchange.com/questions/19330/evil-emacs-how-to-select-last-pasted-text-like-gv/21093
;;
(defun my/evil-select-pasted ()
  (interactive)
  (let ((start-marker (evil-get-marker ?\[))
        (end-marker (evil-get-marker ?\])))
        (evil-visual-select start-marker end-marker)))
(map! :leader
      "v" #'my/evil-select-pasted)
