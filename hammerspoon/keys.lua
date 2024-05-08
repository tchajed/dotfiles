local newTerminal = function()
	local home = os.getenv("HOME")
	hs.execute([[ "/opt/homebrew/bin/kitty" "--single-instance" "--working-directory" ]] .. home)
end

-- hyper+t
-- right fn+pg up on gmmk2
hs.hotkey.bind("ctrl-alt-cmd-shift", "t", newTerminal)

hs.hotkey.bind("ctrl-alt-shift", "1", function()
	hs.caffeinate.lockScreen()
end)
-- meh-3 and hyper-3
-- home and fn2+home on q2 pro
hs.hotkey.bind("ctrl-alt-shift", "3", newTerminal)
hs.hotkey.bind("ctrl-cmd-alt-shift", "3", newTerminal)
