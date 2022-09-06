function emacsEverywhere()
  hs.alert.show("Emacs")
  hs.execute [[ "/usr/local/bin/emacsclient" "--eval" "(emacs-everywhere)" ]]
end
-- doesn't seem to work?
-- hs.hotkey.bind("cmd-alt", "e", emacsEverywhere)

function newTerminal()
  local home = os.getenv("HOME")
  hs.execute([[ "/usr/local/bin/kitty" "--single-instance" "--working-directory" ]] .. home)
end

hs.hotkey.bind("ctrl-alt-cmd-shift", "t", newTerminal)
