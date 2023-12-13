# No greeting when starting an interactive shell.
function fish_greeting
end

## Configure PATH
if [ -f /opt/homebrew/bin/brew ]
	eval (/opt/homebrew/bin/brew shellenv)
end
# Override system binaries with Homebrew
set PATH /usr/local/bin /usr/local/sbin $PATH
# other local executables
set PATH ~/.local/bin $PATH
# Go
set PATH ~/go/bin $PATH
# Rust
set PATH ~/.cargo/bin $PATH
# latexrun
set PATH ~/sw/latexrun $PATH
# Commited scripts in dotfiles
set PATH ~/.dotfiles/bin $PATH
# MacTeX
set PATH /usr/local/texlive/2023/bin/universal-darwin $PATH
# Alectryon
set PATH ~/code/sw/alectryon $PATH
# dotnet (for Boogie)
set PATH ~/.dotnet/tools $PATH
#set PATH (brew --prefix dafny)/libexec/z3/bin $PATH
# Ruby
if test -d "/usr/local/opt/ruby/bin"
  set PATH /usr/local/opt/ruby/bin $PATH
  # should be (gem environment gemdir) but that takes 100ms
  set -l gemdir (echo /usr/local/lib/ruby/gems/* | tail -1)
  set PATH $gemdir/bin $PATH
end
set PATH (echo ~/Library/Python/* | tail -1)/bin $PATH

alias mypyvy="$HOME/sw/mypyvy/src/mypyvy.py"
set PATH ~/code/ivy-docker $PATH

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

# Maelstrom
set PATH ~/code/sw/maelstrom/target/maelstrom $PATH

alias verus=$HOME/code/sw/verus/source/target-verus/release/verus

# takes non-trivial time at startup; replaced with universal variable
# set -Ux RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/library

## Aliases
# see conf.d/aliases.fish

# quickly re-build dependencies
function make_recent
    set -l file (gls -c src/**.v | head -2)
    set -l target (string replace -r '.v$' '.required_vos' $file)
    make -j8 $target
    gtimeout "10s" make -j8 vos
end

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

## direnv (.envrc files)
direnv hook fish | source
