function emacsEverywhere()
  hs.alert.show("Emacs")
  hs.execute [[ "/usr/local/bin/emacsclient" "--eval" "(emacs-everywhere)" ]]
end
-- doesn't seem to work?
-- hs.hotkey.bind("cmd-alt", "e", emacsEverywhere)
