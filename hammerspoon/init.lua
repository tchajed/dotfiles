-- make sure to install this from https://www.hammerspoon.org/Spoons/EmmyLua.html
-- you can unzip and just open the .spoon to install
hs.loadSpoon('EmmyLua')
require('settings')
require('window')
-- require('pianobar')
require('layout')
require('keys')
-- load ipc module so hs tool works
-- (see https://www.hammerspoon.org/docs/hs.ipc.html)
require("hs.ipc")
