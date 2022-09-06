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
-- workaround for window:moveOneScreenEast() not working
function moveWindow(where)
  if hs.window.focusedWindow() then
    local w = hs.window.frontmostWindow()
    local s = hs.screen.mainScreen()
    if (where == "east") then s = s:toEast()
    elseif (where == "west") then s = s:toWest()
    elseif (where == "south") then s = s:toSouth()
    elseif (where == "north") then s = s:toNorth()
    end
    w:moveToScreen(s)
  end
end
hs.hotkey.bind("cmd-ctrl", "right", function()
  moveWindow("east")
end)
hs.hotkey.bind("cmd-ctrl", "left", function()
  moveWindow("west")
end)
hs.hotkey.bind("cmd-ctrl", "up", function()
  moveWindow("north")
end)
hs.hotkey.bind("cmd-ctrl", "down", function()
  moveWindow("south")
end)


-- Throwing windows between spaces
--
-- Looks at the space layout to identify what the "right" and "left" spaces are,
-- on the current screen.

function indexOf(needle, a)
  for i=1,#a do
    if a[i] == needle then
      return i
    end
  end
  return nil
end

function moveWindowToSpace(where)
  local win = hs.window.focusedWindow()
  local space = hs.spaces.focusedSpace()
  -- local spaces = hs.spaces.windowSpaces(win)
  -- if #spaces ~= 1 then
  --   -- unusual window that is on multiple spaces
  --   return nil
  -- end
  -- local space = spaces[1]

  local screen = hs.screen.mainScreen()
  local spaces = hs.spaces.spacesForScreen(screen)
  local currentIndex = indexOf(space, spaces)
  if currentIndex == nil then
    -- this is an error, something is unusual about focused space/screen
    return nil
  end
  local destIndex = currentIndex + where
  -- if destination is out-of-bounds, then do nothing
  if not (1 <= destIndex and destIndex <= #spaces) then
    return nil
  end
  local destSpace = spaces[destIndex]
  hs.spaces.moveWindowToSpace(win, destSpace)
  -- NOTE: focusing the window will switch spaces, but unlike
  -- hs.spaces.gotoSpace() does not open up mission control
  win:focus()
end

hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'left', function() moveWindowToSpace(-1) end)
hs.hotkey.bind({'ctrl', 'shift', 'cmd'}, 'right', function() moveWindowToSpace(1) end)

-- Resizing windows
-- adapted from Anish Athalye

function moveTo(rect)
  -- move the current window to th unit rect
  -- a unit is an on-screen rectangle specified in relative coordinates:
  --   {x,y,w,h} where all components are between 0 and 1
  hs.window.focusedWindow():moveToUnit(rect)
end

-- half of screen
-- hs.hotkey.bind({'ctrl', 'cmd'}, 'h', function() moveTo(hs.layout.left50) end)
-- hs.hotkey.bind({'ctrl', 'cmd'}, 'l', function() moveTo(hs.layout.right50) end )

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
-- to identify monitors, look at hs.screen.allScreens()[1] (and possibly [2])
hs.grid.setGrid('4x3', 'HP ZR2740w')
hs.grid.setGrid('3x3', 'Color LCD')
hs.grid.setGrid('8x4', 'BenQ PD3200U')
hs.grid.setGrid('8x4', 'LG HDR 4K')
hs.grid.setGrid('6x4', 'U2790B')
-- monitor has column of broken pixels on left side; avoid using that strip by
-- starting at x=220 (y=25 is there in the default frame, see
-- hs.screen.find("Dell U3818DW"):frame())
hs.grid.setGrid('8x4', 'Dell U3818DW', hs.geometry(220, 25, 3200, 1308))

hs.grid.setMargins({w = 0, h = 0})
hs.hotkey.bind({'shift', 'cmd'}, 'g', function()
  updateTitleThresh()
  hs.grid.show()
end)
