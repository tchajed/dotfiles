;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Inconsolata for Powerline" :size 18))
(setq doom-big-font (font-spec :family "Inconsolata for Powerline" :size 24))
(setq frame-title-format
    '(""
      "%b"
      (:eval
       (let ((project-name (projectile-project-name)))
         (unless (string= "-" project-name)
           (format " in [%s]" project-name))))
      " - Doom Emacs"))

(setq +lookup-provider-url-alist
      '(("Google"            . "https://google.com/search?q=%s")
        ("Google images"     . "https://www.google.com/search?tbm=isch&q=%s")
        ("GitHub"            . "https://github.com/search?ref=simplesearch&q=%s")
        ("Wolfram alpha"     . "https://wolframalpha.com/input/?i=%s")
        ("Wikipedia"         . "https://wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"))
      )

(defcustom frame-writing-width 110
  "Frame width for writing text, in text columns"
  :type '(integer))

(defun setup-frame-for-writing ()
  "Set frame width for writing text."
  (interactive)
  (set-frame-width (selected-frame) frame-writing-width))

(load! "+coq.el")
(load! "+markdown.el")
(load! "+bindings.el")
(load! "+latex.el")
