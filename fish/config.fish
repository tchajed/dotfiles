# No greeting when starting an interactive shell.
function fish_greeting
end

## Configure PATH
# Override system binaries with Homebrew
set PATH /usr/local/bin /usr/local/sbin $PATH
# other local executables
set PATH ~/.local/bin $PATH
# Go
set PATH ~/go/bin $PATH
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
set PATH /usr/local/opt/minimal-racket/bin $PATH
# MacTeX
set PATH /usr/local/texlive/2021/bin/universal-darwin $PATH
# pip3-installed binaries
set PATH ~/Library/Python/3.9/bin $PATH
# Alectryon
set PATH ~/code/sw/alectryon $PATH
# dotnet (for Boogie)
set PATH ~/.dotnet/tools $PATH
set PATH (brew --prefix dafny)/libexec/z3/bin $PATH

# Doom Emacs
set PATH ~/.emacs.d/bin $PATH

## opam setup
source ~/.opam/opam-init/init.fish
eval (opam config env --shell=fish)

# Coq
#if ! which coqc >/dev/null
  # use local build
  set -x COQBIN /Users/tchajed/code/sw/coq/bin/
  set PATH $COQBIN $PATH
#end

# takes non-trivial time at startup; replaced with universal variable
# set -Ux RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/library

## Aliases
# Use GNU versions
alias sleep="gsleep"
alias realpath="grealpath"
alias readlink="greadlink"
alias sed="gsed"
alias tar="gtar"
alias timeout="gtimeout"

alias make="make -j12"
# quickly re-build dependencies
function make_recent
    set -l file (gls -c src/**.v | head -2)
    set -l target (string replace -r '.v$' '.required_vos' $file)
    make -j8 $target
    gtimeout "10s" make -j8 vos
end

# Emacs aliases
alias e="/usr/local/bin/emacsclient -a '' --no-wait"
alias et="/usr/local/bin/emacsclient --tty"
alias es="/usr/local/bin/emacsclient -a '' --no-wait --eval '(progn (switch-to-buffer \"*scratch*\") (delete-other-windows))'"

# switch to exa
alias ls="exa"
alias ll="exa -l"

# use neovim by default
alias vim="nvim"

## changing java version
function jhome
    set -Ux JAVA_HOME (/usr/libexec/java_home $argv)
    java -version
end

# starship
status --is-interactive; and starship init fish | source

## iTerm 2 shell integration
# https://iterm2.com/shell_integration.html
source ~/.iterm2_shell_integration.fish

## jump integration
status --is-interactive; and source (jump shell fish --bind=z | psub)
