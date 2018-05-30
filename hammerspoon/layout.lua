workLayout = {
  {"com.spotify.client", nil, "Color LCD", hs.geometry.rect(0, 0, 0.66, 0.8), nil, nil},
  {"com.culturedcode.ThingsMac", nil, "Color LCD", hs.geometry.rect(0.66, 0, 0.33, 1), nil, nil},
}
function setWorkLayout()
  hs.layout.apply(workLayout)
end
