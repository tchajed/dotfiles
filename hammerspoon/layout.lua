-- r should have rows, cols, x1, width, y1, height fields
function gridUnitRec(r)
  local x1 = (r.x1-1)/r.cols
  local y1 = (r.y1-1)/r.rows
  return hs.geometry.rect(x1, y1, r.width/r.cols, r.height/r.rows)
end

benQKeys = {"123456", "qwerty", "asdfgh", "zxcvbn"}
macKeys = {"qwe", "asd", "zxc"}

-- translate a single location in a row mapping to 1-based (x,y) coordinations
function cornerToCoords(keyRows, corner)
  for i, row in pairs(keyRows) do
    local idx = row:find(corner)
    if idx then
      return {x=idx, y=i}
    end
  end
end

-- translate a corner specification (eg, "1x") using a key mapping (eg, benQKeys
-- above) to a gridUnitRec rectangle specification
function translateCornerSpec(keyRows, corners)
  local rows = #keyRows
  local cols = #keyRows[1]
  local upperLeft = cornerToCoords(keyRows, corners:sub(1,1))
  local lowerRight = cornerToCoords(keyRows, corners:sub(2,2))
  return {
    rows=#keyRows,
    cols=#keyRows[1],
    x1=upperLeft.x, width=lowerRight.x - upperLeft.x + 1,
    y1=upperLeft.y, height=lowerRight.y - upperLeft.y + 1
  }
end

function layoutSpec(application, monitor, corners)
  local keyRows = nil
  if monitor == "mac" then
    keyRows = macKeys
    monitor = "Color LCD"
  elseif monitor == "benq" then
    keyRows = benQKeys
    monitor = "BenQ PD3200U"
  end
  local rec = gridUnitRec(translateCornerSpec(keyRows, corners))
  return {application, nil, monitor, rec,
          nil, nil}
end

workLayout = {
  layoutSpec("com.spotify.client", "mac", "wc"),
  --layoutSpec("WorkFlowy Beta", "benq", "hn"),
  layoutSpec("com.culturedcode.ThingsMac", "mac", "qa"),
  layoutSpec("Firefox", "mac", "wc"),

  -- temporary config for working on presentation
  -- layoutSpec("com.spotify.client", "mac", "qx"),
  -- layoutSpec("WorkFlowy Beta", "mac", "ec"),
  -- layoutSpec("com.culturedcode.ThingsMac", "benq", "hn"),

  layoutSpec("org.gnu.Emacs", "benq", "1v"),
  layoutSpec("GoLand", "benq", "1v"),
  layoutSpec("PyCharm", "benq", "1v"),

  layoutSpec("com.apple.Preview", "benq", "2v"),
  layoutSpec("net.sourceforge.skim-app.skim", "benq", "3v"),
  layoutSpec("iTerm2", "benq", "5n"),
}

function openSpotify()
  -- ensures Spotify is open and has a window open
  hs.application.open("com.spotify.client", 2, true)
end

function focusApp(name)
  app = hs.application.get(name)
  if app then
    app:activate()
  end
end

function setWorkLayout()
  openSpotify()
  hs.layout.apply(workLayout)
  focusApp("Firefox")
  focusApp("org.gnu.Emacs")
end

hs.hotkey.bind({'shift', 'cmd'}, 'w', setWorkLayout)
