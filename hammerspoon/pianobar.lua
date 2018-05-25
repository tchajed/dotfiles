-- Switching to pianobar
function getPianobar()
  local bundleID = "com.googlecode.iterm2"
  iterm = hs.application.applicationsForBundleID(bundleID)[1]
  return iterm:findWindow("pianobar:1:pianobar")
end

-- Workaround for focusing when desired window is from a different application,
-- on a different screen, and there is another window for that app on the same
-- screen. Need to focus twice, apparently with a short delay in some cases.
function focusWindow(w)
  w:focus()
  hs.itimer.doAfter(0.1, function() w:focus() end)
end

oldWindow = nil
function togglePianobar()
  local currentWindow = hs.window.focusedWindow()
  local pianobar = getPianobar()
  if (currentWindow:id() == pianobar:id()) then
    if (oldWindow == nil) then
      return
    end
    focusWindow(oldWindow)
  else
    oldWindow = currentWindow
    focusWindow(pianobar)
  end
end
