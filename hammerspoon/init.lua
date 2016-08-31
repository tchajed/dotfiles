-- Reload config files when they change
function reloadConfig(files)
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.reload()
      return
    end
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

function reversed(l)
    local reversedList = {}
    for i=1,#l do
        reversedList[i] = l[#l+1 - i]
    end
    return reversedList
end

-- Window hints (quick window selection)
hs.hints.hintChars = {"A","S","D","F","G","H","J","K","L","Q","W","E","R","T","Y","U","I","O","P","C","V","B","N"}
hs.hotkey.bind("cmd", "escape", function()
                 windows = hs.window.allWindows()
                 hs.hints.windowHints(reversed(windows))
end)

-- Throwing windows between screens (monitors)
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
