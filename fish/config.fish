## Configure theme (bobthefish)
set -g theme_color_scheme dark
set -g theme_display_git_ahead_verbose yes
set -g theme_display_ruby no
set -g theme_title_use_abbreviated_path no
set -g theme_git_worktree_support yes
set -g theme_nerd_fonts yes
set -g theme_display_git_master_branch no

## Configure PATH
# Override system binaries with Homebrew
set PATH /usr/local/bin /usr/local/sbin $PATH
# Go binaries
set PATH /usr/local/opt/go/libexec/bin $PATH
# Haskell stack recommended setup
set PATH ~/.stack/programs/x86_64-osx/ghc-8.2.2/bin $PATH
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

# F*
#set PATH ~/code/sw/everest/FStar/bin $PATH
#set PATH ~/code/sw/everest/kremlin $PATH
#set PATH ~/code/sw/everest/z3-4.5.1.1f29cebd4df6-x64-osx-10.11.6/bin $PATH
#set KREMLIN_HOME ~/code/sw/everest/kremlin
#set HACL_HOME ~/code/sw/everest/hacl-star
# Doom Emacs
set PATH ~/doom-emacs.d/bin $PATH

set -gx RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

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

# use NeoVim by default
alias vim="nvim"

## opam setup
source ~/.opam/opam-init/init.fish
eval (opam config env --shell=fish)
# setting MANPATH breaks manpage lookups, which normally use $PATH
# (opam HEAD fixed this by not setting MANPATH if not already set)
#set -e MANPATH

# Coq
# (to override opam version)
set PATH $COQBIN $PATH

## changing java version
function jhome
    set -Ux JAVA_HOME (/usr/libexec/java_home $argv)
    java -version
end

function setupgo
    set -gx GOPATH $PWD
    set PATH $GOPATH/bin $PATH
end

## iTerm 2 shell integration
# https://iterm2.com/shell_integration.html
source ~/.iterm2_shell_integration.fish

## jump integration
status --is-interactive; and source (jump shell fish --bind=z | psub)

## Set up RVM (Ruby)
# https://rvm.io/integration/fish
# disabled because this is extremely slow
#rvm default
