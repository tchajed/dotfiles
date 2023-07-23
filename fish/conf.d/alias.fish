# Use GNU versions
alias sleep="gsleep"
alias realpath="grealpath"
alias readlink="greadlink"
alias sed="gsed"
alias tar="gtar"
alias timeout="gtimeout"

alias make="make -j8"

# Emacs aliases
alias e="/usr/local/bin/emacsclient -a '' --no-wait"
alias et="env TERM=xterm-emacs /usr/local/bin/emacsclient --tty"
alias es="/usr/local/bin/emacsclient -a '' --no-wait --eval '(progn (switch-to-buffer \"*scratch*\") (delete-other-windows))'"

# switch to exa
alias ls="exa"
alias ll="exa -l"
alias la="exa -a"

# use neovim by default
alias vim="nvim"

alias s="kitty +kitten ssh"

