#!/bin/sh

# Install a few essential Homebrew packages, especially if they're implicit
# dependencies of scripts.

casks="
1password
gpg-suite
karabiner-elements
kitty
visual-studio-code
skim
font-victor-mono-nerd-font
font-victor-mono
font-inconsolata-nerd-font
"

pkgs="
btop
hammerspoon
direnv
wget
exa
rustup
opam
starship
jump
nvim
coreutils

ripgrep
fd
fzf
gnu-sed
gnu-tar
grep
tree
parallel

black
"

brew install --cask $casks
brew install $pkgs
