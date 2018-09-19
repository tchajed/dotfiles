function gridUnitRec(rows, cols, x1, width, y1, height)
  x1 = (x1-1)/cols
  y1 = (y1-1)/rows
  return hs.geometry.rect(x1, y1, width/cols, height/rows)
end

function layoutSpec(application, monitor, locationSpec)
  if monitor == "mac" then
    rows, cols = 3, 3
    monitor = "Color LCD"
  elseif monitor == "benq" then
    rows, cols = 4, 6
    monitor = "BenQ PD3200U"
  end
  return {application, nil, monitor,
          gridUnitRec(rows, cols,
                      locationSpec[1],
                      locationSpec[2],
                      locationSpec[3],
                      locationSpec[4]),
          nil, nil}
end

workLayout = {
  layoutSpec("com.spotify.client", "mac", {2, 2, 1, 3}),
  layoutSpec("com.culturedcode.ThingsMac", "mac", {1, 1, 1, 2}),
  layoutSpec("com.google.Chrome", "benq", {5, 2, 1, 2}),
  layoutSpec("Emacs", "benq", {1, 2, 1, 4}),
  layoutSpec("iTerm2", "benq", {5, 1, 3, 2}),
  layoutSpec("WorkFlowy Beta", "benq", {6, 1, 3, 2}),
}
function setWorkLayout()
  hs.layout.apply(workLayout)
end

hs.hotkey.bind({'shift', 'cmd'}, 'w', setWorkLayout)
