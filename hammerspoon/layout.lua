-- restore a particular configured window layout
-- currently the config is broken (it doesn't correspond to my current use), but
-- there's a bunch of generic infrastructure here

-- trigger hs.application to load
local _ = hs.application
local _ = hs.osascript

function quitApp(appName)
	local app = hs.application.get(appName)
	if app then
		app:kill()
	end
end

-- Function to close all windows of an app without quitting
function closeWindows(appName)
	local app = hs.application.get(appName)
	if app then
		local windows = app:allWindows()
		for _, win in ipairs(windows) do
			win:close()
		end
	end
end

function openChrome(url)
	-- written with the help of ChatGPT
	local chrome = focusApp("com.google.Chrome")
	if chrome then
		hs.osascript.applescript([[
tell application "Google Chrome"
  make new window
  set URL of active tab of first window to "]] .. url .. [["
end tell
]])
		local win = chrome:mainWindow()
		local screens = hs.screen.allScreens()
		if screens and #screens > 1 then
			win:moveToScreen(screens[2])
		end
	end
end

function setLectureLayout()
	-- get these bundle IDs with hs.application.get("name"):bundleID()
	quitApp("com.spotify.client")
	closeWindows("keybase.Electron")
	closeWindows("com.apple.MobileSMS") -- Messages
	closeWindows("com.culturedcode.ThingsMac")
	closeWindows("Slack")
	openChrome("https://tchajed.github.io/sys-verif-fa24/notes/")
end

-- r should have rows, cols, x1, width, y1, height fields
function gridUnitRec(r)
	local x1 = (r.x1 - 1) / r.cols
	local y1 = (r.y1 - 1) / r.rows
	return hs.geometry.rect(x1, y1, r.width / r.cols, r.height / r.rows)
end

dellKeys = { "123456", "qwerty", "asdfgh", "zxcvbn" }
dellwideKeys = { "12345678", "qwertyui", "asdfghjk", "zxcvbnm," }
macKeys = { "qwe", "asd", "zxc" }

-- translate a single location in a row mapping to 1-based (x,y) coordinations
function cornerToCoords(keyRows, corner)
	for i, row in pairs(keyRows) do
		local idx = row:find(corner)
		if idx then
			return { x = idx, y = i }
		end
	end
end

-- translate a corner specification (eg, "1x") using a key mapping (eg, dellKeys
-- above) to a gridUnitRec rectangle specification
function translateCornerSpec(keyRows, corners)
	local rows = #keyRows
	local cols = #keyRows[1]
	local upperLeft = cornerToCoords(keyRows, corners:sub(1, 1))
	local lowerRight = cornerToCoords(keyRows, corners:sub(2, 2))
	return {
		rows = #keyRows,
		cols = #keyRows[1],
		x1 = upperLeft.x,
		width = lowerRight.x - upperLeft.x + 1,
		y1 = upperLeft.y,
		height = lowerRight.y - upperLeft.y + 1,
	}
end

function layoutSpec(application, monitor, corners)
	local keyRows = nil
	if monitor == "mac" then
		keyRows = macKeys
		monitor = "Color LCD"
	elseif monitor == "dell" then
		keyRows = dellwideKeys
		-- TODO: make this recognize the external monitor and not be hard coded
		monitor = "Dell U2723QE"
	end
	local rec = gridUnitRec(translateCornerSpec(keyRows, corners))
	return { application, nil, monitor, rec, nil, nil }
end

workLayout = {
	layoutSpec("com.spotify.client", "mac", "wc"),
	-- layoutSpec("Chrome", "mac", "wc"),

	-- temporary config for working on presentation
	-- layoutSpec("com.spotify.client", "mac", "qx"),
	-- layoutSpec("WorkFlowy Beta", "mac", "ec"),
	-- layoutSpec("com.culturedcode.ThingsMac", "benq", "hn"),

	-- layoutSpec("org.gnu.Emacs", "benq", "1v"),
	-- layoutSpec("GoLand", "benq", "1v"),
	-- layoutSpec("PyCharm", "benq", "1v"),
	layoutSpec("org.gnu.Emacs", "dell", "2b"),
	layoutSpec("GoLand", "dell", "2b"),

	-- layoutSpec("com.apple.Preview", "benq", "2v"),
	-- layoutSpec("net.sourceforge.skim-app.skim", "benq", "3v"),
	-- layoutSpec("iTerm2", "benq", "5n"),
	layoutSpec("Kitty", "dell", "6k"),
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
	return app
end

function setWorkLayout()
	openSpotify()
	hs.layout.apply(workLayout)
	-- bring these forward
	focusApp("Chrome")
	focusApp("org.gnu.Emacs")
end

-- hs.hotkey.bind({'shift', 'cmd'}, 'w', setWorkLayout)
