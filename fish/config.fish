# No greeting when starting an interactive shell.
function fish_greeting
end

## Configure PATH
if [ -f /opt/homebrew/bin/brew ]
    eval (/opt/homebrew/bin/brew shellenv)
end
# user_functions comes from dotfiles, standard ~/.config/fish/functions is
# managed by fisher
set fish_function_path $__fish_config_dir/user_functions $fish_function_path
# Override system binaries with Homebrew
fish_add_path /usr/local/bin /usr/local/sbin
fish_add_path ~/go/bin ~/.cargo/bin ~/.dotnet/tools ~/.local/bin
fish_add_path ~/code/dotfiles/bin
fish_add_path ~/sw/latexrun ~/sw/alectryon
# Ruby
if test -d /usr/local/opt/ruby/bin
    fish_add_path /usr/local/opt/ruby/bin
    # should be (gem environment gemdir) but that takes 100ms
    set -l gemdir (echo /usr/local/lib/ruby/gems/* | tail -1)
    fish_add_path $gemdir/bin
end
fish_add_path (echo ~/Library/Python/* | tail -1)/bin

alias mypyvy="$HOME/sw/mypyvy/src/mypyvy.py"
fish_add_path ~/code/ivy-docker

# Doom Emacs
fish_add_path ~/.emacs.d/bin

## opam setup
source ~/.opam/opam-init/init.fish
eval (opam config env --shell=fish)

# Coq
function use_coq_dev
    set -l COQ_REPO ~/sw/coq
    if test -d $COQ_REPO/_build/install/default/bin
        set -x COQBIN $COQ_REPO/_build/install/default/bin/
    else
        set -x COQBIN $COQ_REPO/bin/
    end
    fish_add_path --prepend --path $COQBIN
end
# if already in opam, use that
if ! which coqc >/dev/null
    # use local build
    use_coq_dev
end

# Maelstrom
fish_add_path ~/sw/maelstrom/target/maelstrom

alias verus=$HOME/sw/verus/source/target-verus/release/verus

# takes non-trivial time at startup; replaced with universal variable
# set -Ux RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/library

## Aliases
# see conf.d/aliases.fish

# quickly re-build dependencies
function make_recent
    set -l file (gls -c src/**.v | head -2)
    set -l target (string replace -r '.v$' '.required_vos' $file)
    make -j8 $target
    gtimeout 10s make -j8 vos
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
if test -f ~/.iterm2_shell_integration.fish
    # not sure if this even affects kitty
    source ~/.iterm2_shell_integration.fish
end

## zoxide integration
status --is-interactive; and zoxide init fish | source

## direnv (.envrc files)
direnv hook fish | source

# Set up fzf key bindings
fzf --fish | source

# gh is an alias that uses op, the 1password CLI
source /Users/tchajed/.config/op/plugins.sh

# too slow
# load_nvm
