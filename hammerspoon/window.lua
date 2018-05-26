-- Window hints (quick window selection)

function reversed(l)
  local reversedList = {}
  for i=1,#l do
    reversedList[i] = l[#l+1 - i]
  end
  return reversedList
end

function updateTitleThresh()
    local numScreens = #hs.screen.allScreens()
    -- above this many windows, titles are shown
    hs.hints.showTitleThresh = 4 * numScreens
end
hs.screen.watcher.new(updateTitleThresh):start()
updateTitleThresh()
hs.hints.hintChars = {"A","S","D","F","G","H","J","K","L","Q","W","E","R","T","Y","U","I","O","P","C","V","B","N"}
hs.hotkey.bind("cmd", "escape", function()
                 windows = hs.window.allWindows()
                 hs.hints.windowHints(reversed(windows))
end)

-- Throwing windows between screens (monitors)
hs.window.animationDuration = 0 -- default is 0.2
hs.hotkey.bind("cmd-ctrl", "right", function()
                 hs.window.focusedWindow():moveOneScreenEast()
end)
hs.hotkey.bind("cmd-ctrl", "left", function()
                 hs.window.focusedWindow():moveOneScreenWest()
end)
hs.hotkey.bind("cmd-ctrl", "up", function()
                 hs.window.focusedWindow():moveOneScreenNorth()
end)
hs.hotkey.bind("cmd-ctrl", "down", function()
                 hs.window.focusedWindow():moveOneScreenSouth()
end)

-- Resizing windows
-- copied from Anish Athalye

-- half of screen
-- use up/down to not conflcit with space switching left/right
hs.hotkey.bind({'alt', 'cmd'}, 'up', function() hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 1}) end)
hs.hotkey.bind({'alt', 'cmd'}, 'down', function() hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 1}) end)
-- hs.hotkey.bind({'alt', 'shift'}, 'up', function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 0.5}) end)
-- hs.hotkey.bind({'alt', 'shift'}, 'down', function() hs.window.focusedWindow():moveToUnit({0, 0.5, 1, 0.5}) end)

-- quarter of screen
hs.hotkey.bind({'shift', 'alt', 'cmd'}, 'left', function() hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 0.5}) end)
hs.hotkey.bind({'shift', 'alt', 'cmd'}, 'right', function() hs.window.focusedWindow():moveToUnit({0.5, 0.5, 0.5, 0.5}) end)
hs.hotkey.bind({'shift', 'alt', 'cmd'}, 'up', function() hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 0.5}) end)
hs.hotkey.bind({'shift', 'alt', 'cmd'}, 'down', function() hs.window.focusedWindow():moveToUnit({0, 0.5, 0.5, 0.5}) end)

-- full screen
hs.hotkey.bind({'alt', 'cmd'}, 'f', function() hs.window.focusedWindow():moveToUnit({0, 0, 1, 1}) end)

-- center screen
hs.hotkey.bind({'alt', 'cmd'}, 'c', function() hs.window.focusedWindow():centerOnScreen() end)

-- grid gui
hs.grid.setGrid('4x3', 'HP ZR2740w')
hs.grid.setMargins({w = 0, h = 0})
hs.hotkey.bind({'shift', 'cmd'}, 'g', hs.grid.show)
