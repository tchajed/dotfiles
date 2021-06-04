#!/usr/bin/env bash

set -eu

is_running=false
if VBoxManage list runningvms | grep -q 'Arch'; then
  is_running=true
fi

cantor-start
ssh hamilton 'yay -Syu --noconfirm'
ssh hamilton 'yay -Sc --noconfirm'

echo "rebooting..."
ssh hamilton 'sudo reboot' || true
sleep 5
cantor-start

# only stop VM if it wasn't originally running
if [ "$is_running" = false ]; then
  VBoxManage controlvm "Arch" savestate
fi
