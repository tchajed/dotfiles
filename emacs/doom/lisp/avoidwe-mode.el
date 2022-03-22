;;; ~/.doom.d/lisp/avoidwe-mode.el -*- lexical-binding: t; -*-

;;; avoidwe-mode.el --- Don't use "we"
;;
;; Tool to follow Frans's advice and avoid "we". Actually Frans wanted to
;; disable typing "we" but (1) that's a bit extreme and (2) I'm not entirely
;; sure how to do that.
;;
;; Author: Tej Chajed
;; Created: 2022-03-22
;; Version: 1.1
;; Last-Updated: 2022-03-22
;; Keywords: wp
;; Homepage: https://github.com/tchajed/dotfiles/blob/master/emacs/doom/lisp/avoidwe-mode.el
;; Package-Requires: ((emacs "24.1"))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;  This minor mode highlights "we".
;;
;;  Implementation extracted from writegood-mode.el
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;; 1.1 Include underlining as well in face
;; 1.0 Initial version
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

(require 'regexp-opt)
(require 'faces)

(defgroup avoidwe nil
  "Minor mode to avoid 'we'."
  :prefix "avoidwe-"
  :group 'help
  :link '(url-link "https://github.com/tchajed/dotfiles/blob/master/emacs/doom/lisp/avoidwe-mode.el")
  )

(defconst avoidwe-version "1.1"
  "avoidwe-mode version")

(defface avoidwe-bads-face
  '( ;;(((supports :underline (:style wave)))
     ;; :underline (:style wave :color "DarkOrange"))
    (((class color) (background light))
     (:inherit font-lock-warning-face :background "moccasin"
      :underline (:style wave :color "DarkOrange")))
    (((class color) (background dark))
     (:inherit font-lock-warning-face :background "DarkOrange")))
  "Face for 'we'"
  :group 'avoidwe)

(defcustom avoidwe-words
  '("we")
  "The words to avoid"
  :group 'avoidwe
  :type '(repeat string))

(defun avoidwe-bads-font-lock-keywords-regexp ()
  "Generate regex that matches bad-words"
  (concat "\\b" (regexp-opt avoidwe-words) "\\b"))

(defun avoidwe-bads-font-lock-keywords ()
  (list (list (avoidwe-bads-font-lock-keywords-regexp)
              0 (quote 'avoidwe-bads-face) 'prepend)))

;;;;;;;;;;;;;;;;;;;; Functions:

(defun avoidwe-version ()
  "Tell the version you are using"
  (interactive)
  (message avoidwe-version))

(defun avoidwe-bads-turn-on ()
  "Turn on syntax highlighting for we"
  (font-lock-add-keywords nil (avoidwe-bads-font-lock-keywords) t))

(defun avoidwe-bads-turn-off ()
  "Turn off syntax highlighting for we"
  (font-lock-remove-keywords nil (avoidwe-bads-font-lock-keywords)))

(defun avoidwe-turn-on ()
  "Turn on avoidwe-mode."
  (make-local-variable 'font-lock-keywords-case-fold-search)
  (setq font-lock-keywords-case-fold-search t)
  (avoidwe-bads-turn-on))

(defun avoidwe-turn-off ()
  "Turn off avoidwe-mode."
  (avoidwe-bads-turn-off))

;;;###autoload
(define-minor-mode avoidwe-mode
  "Highlight uses of 'we'."
  :lighter " We"
  (progn
    (if avoidwe-mode
        (avoidwe-turn-on)
      (avoidwe-turn-off))
    (font-lock-mode 1)))

(provide 'avoidwe-mode)

;;; avoidwe-mode.el ends here
