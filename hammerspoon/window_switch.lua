-- Window hints (quick window selection)

-- this isn't all that useful so I no longer use it

local function reversed(l)
	local reversedList = {}
	for i = 1, #l do
		reversedList[i] = l[#l + 1 - i]
	end
	return reversedList
end

local function updateTitleThresh()
	local numScreens = #hs.screen.allScreens()
	if numScreens > 1 then
		-- above this many windows, titles are shown
		hs.hints.showTitleThresh = 20
	else
		hs.hints.showTitleThresh = 5
	end
end
updateTitleThresh()
hs.hints.hintChars = {
	"A",
	"S",
	"D",
	"F",
	"G",
	"H",
	"J",
	"K",
	"L",
	"Q",
	"W",
	"E",
	"R",
	"T",
	"Y",
	"U",
	"I",
	"O",
	"P",
	"C",
	"V",
	"B",
	"N",
}
hs.hotkey.bind("cmd", "escape", function()
	local windows = hs.window.allWindows()
	hs.hints.windowHints(reversed(windows))
end)
