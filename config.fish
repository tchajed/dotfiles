## Configure theme (bobthefish)
set -g theme_display_git_ahead_verbose yes
set -g theme_display_ruby no

## Configure PATH
# Override system binaries with Homebrew
set PATH /usr/local/bin $PATH
# Go binaries
set PATH /usr/local/opt/go/libexec/bin $PATH
# Haskell stack recommended setup
set PATH ~/.stack/programs/x86_64-osx/ghc-7.10.3/bin $PATH
# Coq
set PATH $COQBIN $PATH
# Commited scripts in dotfiles
set PATH ~/.dotfiles/bin $PATH


## Aliases
# Use GNU versions
alias sleep="gsleep"
alias realpath="grealpath"
alias readlink="greadlink"
alias sed="gsed"
alias tar="gtar"

# Emacs aliases
alias e="/usr/local/bin/emacsclient -a emacs-app --no-wait --create-frame"
alias et="/usr/local/bin/emacsclient --tty --create-frame"
alias es="/usr/local/bin/emacsclient -a emacs-app --no-wait --create-frame --eval '(progn (switch-to-buffer \"*scratch*\") (delete-other-windows))'"

## mvim setup
# Fix starting mvim from within tmux
if test (which reattach-to-user-namespace)
    set -l mvim_path (which mvim)
    alias mvim "reattach-to-user-namespace $mvim_path"
end
# complete mvim correctly
complete --command mvim --wraps vim

## opam setup
source ~/.opam/opam-init/init.fish
# setting MANPATH breaks manpage lookups, which normally use $PATH
set -e MANPATH

## changing java version
function jhome
    set -Ux JAVA_HOME (/usr/libexec/java_home $argv)
    java -version
end

## iTerm 2 shell integration
# https://iterm2.com/shell_integration.html
source ~/.iterm2_shell_integration.fish
