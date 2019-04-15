function gridUnitRec(rows, cols, x1, width, y1, height)
  x1 = (x1-1)/cols
  y1 = (y1-1)/rows
  return hs.geometry.rect(x1, y1, width/cols, height/rows)
end

benQKeys = {"123456", "qwerty", "asdfgh", "zxcvbn"}
macKeys = {"qwe", "asd", "zxc"}

-- translate a single location in a row mapping to 1-based (x,y) coordinations
function cornerToCoords(keyRows, corner)
  for i, row in pairs(keyRows) do
    idx = row:find(corner)
    if idx then
      return {x=idx, y=i}
    end
  end
end

-- translate a corner specification (eg, "1x") using a key mapping (eg, benQKeys
-- above) to a locationSpec (x1, width, y1, width)
-- locationSpec: x_start, x_width, y_start, y_height
-- 123456
-- 2
-- 3
-- 4
function translateCornerSpec(keyRows, corners)
  upperLeft = cornerToCoords(keyRows, corners:sub(1,1))
  lowerRight = cornerToCoords(keyRows, corners:sub(2,2))
  return {
    -- x1, width
    upperLeft.x, lowerRight.x - upperLeft.x + 1,
    -- y1, height
    upperLeft.y, lowerRight.y - upperLeft.y + 1
  }
end

function layoutSpec(application, monitor, corners)
  local keyRows = nil
  if monitor == "mac" then
    -- TODO: rows, cols is redundant with keys
    rows, cols = 3, 3
    keyRows = macKeys
    monitor = "Color LCD"
  elseif monitor == "benq" then
    rows, cols = 4, 6
    keyRows = benQKeys
    monitor = "BenQ PD3200U"
  end
  locationSpec = translateCornerSpec(keyRows, corners)
  return {application, nil, monitor,
          gridUnitRec(rows, cols,
                      locationSpec[1],
                      locationSpec[2],
                      locationSpec[3],
                      locationSpec[4]),
          nil, nil}
end

workLayout = {
  layoutSpec("com.spotify.client", "mac", "wc"),
  layoutSpec("WorkFlowy Beta", "benq", "hn"),
  layoutSpec("com.culturedcode.ThingsMac", "mac", "qa"),

  -- temporary config for working on presentation
  -- layoutSpec("com.spotify.client", "mac", "qx"),
  -- layoutSpec("WorkFlowy Beta", "mac", "ec"),
  -- layoutSpec("com.culturedcode.ThingsMac", "benq", "hn"),

  layoutSpec("com.google.Chrome", "benq", "5y"),
  layoutSpec("org.gnu.Emacs", "benq", "1v"),
  layoutSpec("GoLand", "benq", "1v"),

  layoutSpec("com.apple.Preview", "benq", "3v"),
  layoutSpec("net.sourceforge.skim-app.skim", "benq", "3v"),
  layoutSpec("iTerm2", "benq", "gb"),
}

function openSpotify()
  -- ensures Spotify is open and has a window open
  hs.application.open("com.spotify.client", 2, true)
end

function focusEmacs()
  app = hs.application.get("org.gnu.Emacs")
  if app then
    app:activate()
  end
end

function setWorkLayout()
  openSpotify()
  hs.layout.apply(workLayout)
  focusEmacs()
end

hs.hotkey.bind({'shift', 'cmd'}, 'w', setWorkLayout)
