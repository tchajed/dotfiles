# Use GNU versions
alias sleep="gsleep"
alias realpath="grealpath"
alias readlink="greadlink"
alias sed="gsed"
alias tar="gtar"
alias timeout="gtimeout"

# replaced with MAKEFLAGS
#alias make="make -j12"
alias make="caffeinate make"

# Emacs aliases
alias e="emacsclient -a '' --no-wait"
alias et="emacsclient --tty"
alias es="emacsclient -a '' --no-wait --eval '(progn (switch-to-buffer \"*scratch*\") (delete-other-windows))'"

# switch to eza
alias ls="eza"
alias ll="eza -l"
alias la="eza -a"
# easy typo, and exa is easier to type than eza
alias exa="eza"

alias vim="nvim"
# switched away from LunarVim, but still have minor muscle memory for this and it might be in shell history.
alias lvim="nvim"

alias s="kitty +kitten ssh"

alias weather="wthrr"
