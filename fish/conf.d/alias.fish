# Use GNU versions
alias sleep="gsleep"
alias realpath="grealpath"
alias readlink="greadlink"
alias sed="gsed"
alias tar="gtar"
alias timeout="gtimeout"

alias make="make -j8"

# Emacs aliases
alias e="emacsclient -a '' --no-wait"
alias et="emacsclient --tty"
alias es="emacsclient -a '' --no-wait --eval '(progn (switch-to-buffer \"*scratch*\") (delete-other-windows))'"

# switch to eza
alias ls="eza"
alias ll="eza -l"
alias la="eza -a"

# use lvim by default
alias vim="lvim"

alias s="kitty +kitten ssh"

