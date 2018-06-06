workLayout = {
  {"com.spotify.client", nil, "Color LCD", hs.geometry.rect(0, 0, 0.66, 0.8), nil, nil},
  {"com.culturedcode.ThingsMac", nil, "Color LCD", hs.geometry.rect(0.66, 0, 0.33, 1), nil, nil},
  {"com.google.Chrome", nil, "SyncMaster", hs.geometry.rect(0.1, 0, 0.8, 0.8), nil, nil},
}
function setWorkLayout()
  hs.layout.apply(workLayout)
end

hs.hotkey.bind({'shift', 'cmd'}, 'w', setWorkLayout)
