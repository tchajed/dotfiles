#!/usr/bin/env fish
function bt_is_on
  [ (blueutil -p) = "1" ]
end
function bt_is_off
  ! bt_is_on
end

function bluetooth -a cmd
  if [ "$cmd" = "off" -o "$cmd" = "disable" ]
    blueutil -p 0
    echo "bluetooth off"
  else if [ "$cmd" = "on" -o "$cmd" = "enable" ]
    blueutil -p 1
    echo "bluetooth on"
  else if [ "$cmd" = "toggle" ]
    blueutil -p toggle
  else
    echo "usage: bluetooth (off|on|toggle)" 1>&2
  end
end

# complete only to the opposite
complete bluetooth --no-files --require-parameter -a "on" --condition bt_is_off
complete bluetooth --no-files --require-parameter -a "off" --condition bt_is_on
