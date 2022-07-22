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
set PATH ~/.gem/ruby/3.1.0/bin $PATH
# Racket
set PATH /usr/local/opt/minimal-racket/bin $PATH
# MacTeX
set PATH /usr/local/texlive/2022/bin/universal-darwin $PATH
# pip3-installed binaries
set PATH ~/Library/Python/3.9/bin $PATH
# Alectryon
set PATH ~/code/sw/alectryon $PATH
# dotnet (for Boogie)
set PATH ~/.dotnet/tools $PATH
set PATH (brew --prefix dafny)/libexec/z3/bin $PATH
# Ruby
if test -d "/usr/local/opt/ruby/bin"
  set PATH /usr/local/opt/ruby/bin $PATH
  # ugh this takes 100ms
  set PATH (gem environment gemdir)/bin $PATH
end

# Doom Emacs
set PATH ~/.emacs.d/bin $PATH

## opam setup
source ~/.opam/opam-init/init.fish
eval (opam config env --shell=fish)

# Coq
if ! which coqc >/dev/null
  # use local build
  set -l COQ_REPO /Users/tchajed/code/sw/coq
  if test -d $COQ_REPO/_build/install/default/bin
    set -x COQBIN $COQ_REPO/_build/install/default/bin/
  else
    set -x COQBIN $COQ_REPO/bin/
  end
  set PATH $COQBIN $PATH
end

# takes non-trivial time at startup; replaced with universal variable
# set -Ux RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/library

## Homebrew config
# man brew
set -gx HOMEBREW_NO_EMOJI 1
set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
set -gx HOMEBREW_NO_ENV_HINTS 1

## Aliases
# Use GNU versions
alias sleep="gsleep"
alias realpath="grealpath"
alias readlink="greadlink"
alias sed="gsed"
alias tar="gtar"
alias timeout="gtimeout"

alias make="make -j8"
# quickly re-build dependencies
function make_recent
    set -l file (gls -c src/**.v | head -2)
    set -l target (string replace -r '.v$' '.required_vos' $file)
    make -j8 $target
    gtimeout "10s" make -j8 vos
end

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

## changing java version
function jhome
    set -Ux JAVA_HOME (/usr/libexec/java_home $argv)
    java -version
end

# starship
status --is-interactive; and starship init fish | source

# needed due to https://github.com/starship/starship/pull/2636
#function fish_mode_prompt; end

## iTerm 2 shell integration
# https://iterm2.com/shell_integration.html
# must be loaded after starship since it modifies the prompt
source ~/.iterm2_shell_integration.fish

## jump integration
status --is-interactive; and source (jump shell fish --bind=z | psub)
