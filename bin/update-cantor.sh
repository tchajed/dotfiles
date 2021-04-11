#!/usr/bin/env bash

set -eu

cantor-start
ssh hamilton 'yay -Syu --noconfirm'
ssh hamilton 'yay -Sc --noconfirm'

echo "rebooting..."
ssh hamilton 'sudo poweroff' || true
sleep 3
cantor-start
VBoxManage controlvm "Arch" savestate
