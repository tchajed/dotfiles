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
  if numScreens > 1 then
    -- above this many windows, titles are shown
    hs.hints.showTitleThresh = 20
  else
    hs.hints.showTitleThresh = 5
  end
end
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
-- adapted from Anish Athalye

function moveTo(rect)
  -- move the current window to th unit rect
  -- a unit is an on-screen rectangle specified in relative coordinates:
  --   {x,y,w,h} where all components are between 0 and 1
  hs.window.focusedWindow():moveToUnit(rect)
end

-- half of screen
hs.hotkey.bind({'ctrl', 'cmd'}, 'h', function() moveTo(hs.layout.left50) end)
hs.hotkey.bind({'ctrl', 'cmd'}, 'l', function() moveTo(hs.layout.right50) end )

-- quarter of screen
hs.hotkey.bind({'shift', 'alt', 'cmd'}, 'left',
  function() moveTo({0, 0, 0.5, 0.5}) end)
hs.hotkey.bind({'shift', 'alt', 'cmd'}, 'right',
  function() moveTo({0.5, 0.5, 0.5, 0.5}) end)
hs.hotkey.bind({'shift', 'alt', 'cmd'}, 'up',
  function() moveTo({0.5, 0, 0.5, 0.5}) end)
hs.hotkey.bind({'shift', 'alt', 'cmd'}, 'down',
  function() moveTo({0, 0.5, 0.5, 0.5}) end)

-- full screen
hs.hotkey.bind({'alt', 'cmd'}, 'f', function() moveTo(hs.layout.maximized) end)

-- center screen
hs.hotkey.bind({'alt', 'cmd'}, 'c', function()
    hs.window.focusedWindow():centerOnScreen()
    leftBorder = 0.25
    topBorder = 0.18
    moveTo({leftBorder, topBorder, (1-2*leftBorder), (1-2*topBorder)})
end)

-- grid gui
--
-- per-monitor configuration
hs.grid.setGrid('4x3', 'HP ZR2740w')
hs.grid.setGrid('3x3', 'Color LCD')
hs.grid.setGrid('6x4', 'BenQ PD3200U')

hs.grid.setMargins({w = 0, h = 0})
hs.hotkey.bind({'shift', 'cmd'}, 'g', function()
  updateTitleThresh()
  hs.grid.show()
end)
