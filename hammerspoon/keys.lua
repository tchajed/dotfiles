local emacsEverywhere = function()
  hs.alert.show("Emacs")
  hs.execute [[ "/usr/local/bin/emacsclient" "--eval" "(emacs-everywhere)" ]]
end
-- doesn't seem to work?
-- hs.hotkey.bind("cmd-alt", "e", emacsEverywhere)

local newTerminal = function()
  local home = os.getenv("HOME")
  hs.execute([[ "/opt/homebrew/bin/kitty" "--single-instance" "--working-directory" ]] .. home)
end

-- hyper+t
-- right fn+pg up on gmmk2
hs.hotkey.bind("ctrl-alt-cmd-shift", "t", newTerminal)
