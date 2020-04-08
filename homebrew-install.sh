#!/bin/sh

# Install a few essential Homebrew packages, especially if they're implicit
# dependencies of scripts.

pkgs="
vitorgalvao/tiny-scripts/cask-repair
cloc
codemod
coreutils
curl
diff-so-fancy
fd
fish
fswatch
fzf
gcc
git
gnu-sed
gnu-tar
gnuplot
go
grep
htop
imagemagick
make
pandoc
parallel
ripgrep
rsync
tmux
tree
wget
youtube-dl
findutils
pinentry-mac
"

brew install $pkgs
