# No greeting when starting an interactive shell.
function fish_greeting
end

## Configure PATH
# Override system binaries with Homebrew
set PATH /usr/local/bin /usr/local/sbin $PATH
# Stack executables
set PATH ~/.local/bin $PATH
# Go
set GOPATH ~/go
set PATH $GOPATH/bin $PATH
# Rust
set PATH ~/.cargo/bin $PATH
# latexrun
set PATH ~/code/sw/latexrun $PATH
# Commited scripts in dotfiles
set PATH ~/.dotfiles/bin $PATH
# Ruby gem binaries
#set PATH /usr/local/lib/ruby/gems/2.6.3/bin /usr/local/Cellar/ruby/2.6.3/bin $PATH
set PATH ~/.gem/bin $PATH
# Racket
set PATH /usr/local/Cellar/minimal-racket/7.6/bin $PATH
# MacTeX
set PATH /usr/local/texlive/2020/bin/x86_64-darwin $PATH

# Doom Emacs
set PATH ~/.emacs.d/bin $PATH

# takes non-trivial time at startup; replaced with universal variable
# set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

## Aliases
# Use GNU versions
alias sleep="gsleep"
alias realpath="grealpath"
alias readlink="greadlink"
alias sed="gsed"
alias tar="gtar"
alias timeout="gtimeout"

# Emacs aliases
alias e="/usr/local/bin/emacsclient -a '' --no-wait"
alias et="/usr/local/bin/emacsclient --tty"
alias es="/usr/local/bin/emacsclient -a '' --no-wait --eval '(progn (switch-to-buffer \"*scratch*\") (delete-other-windows))'"

# switch to exa
alias ls="exa"
alias ll="exa -l"

# use neovim by default
alias vim="nvim"

## opam setup
source ~/.opam/opam-init/init.fish
eval (opam config env --shell=fish)

# Coq
# (to override opam version)
set PATH $COQBIN $PATH

## changing java version
function jhome
    set -Ux JAVA_HOME (/usr/libexec/java_home $argv)
    java -version
end

function dafny
  mono /Users/tchajed/.vscode/extensions/correctnesslab.dafny-vscode-*/dafny/dafny/Dafny.exe $argv
end

# starship
status --is-interactive; and starship init fish | source

## iTerm 2 shell integration
# https://iterm2.com/shell_integration.html
source ~/.iterm2_shell_integration.fish

## jump integration
status --is-interactive; and source (jump shell fish --bind=z | psub)
