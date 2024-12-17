### INIT OPTIONS
set fish_greeting
if status is-interactive
	pokemon-colorscripts-go -n charmander --no-title
    # carapace setup (override builtin completions)
    carapace _carapace | source
    direnv hook fish | source
    pyenv init - | source
    nvm use latest >> /dev/null
end

if status is-login
and not set -q TMUX
    dbus-run-session startx
end

# Silly tmux outlives sway
# if set -q TMUX
#     set -g SWAYSOCK /run/user/1000/sway-ipc.1000.$(pidof sway).sock
# end

# NOTE: to get rid of poetry completion error, run:
# poetry completions fish > ..../fish/vendor_completions.d/poetry.fish
# because it seems to be kinda fucked up by default


### BINDS
bind \cz ''
bind -s \ek 'my_clear'
bind \el 'my_ls'
bind \ev 'nvim'
bind \cf 'nvim-fzf'
bind \ed 'pushd ..; commandline -f repaint'
bind \ef 'popd; commandline -f repaint'


### ALIASES
alias gnome-polkit="/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
alias lsa="g -l -a --icons"
alias ll="g -l --icons"
alias cls="clear ; pokemon-colorscripts -r --no-title"
alias activate="source ./venv/bin/activate.fish"
alias rmr="rm -r"
alias rmrf="rm -rf"
alias rmf="rm -f"
alias dog="cat"
alias sudoe="sudoedit"
alias feh="feh --scale-down --geometry 1000x800"
alias info="info --vi-keys"
alias battery="cat /sys/class/power_supply/BAT1/capacity"
alias v="nvim"


### FUNCTIONS
function mkcd
	mkdir -p $argv;
	cd $argv;
end

function runclang
	set name $(string sub -e -2 $argv).out
	clang -Wall $argv -o /tmp/$name
	/tmp/$name
    rm /tmp/$name
end


function runcpp
	set name $(string sub -e -2 $argv).out
	clang++ -Wall -std=c++20 $argv -o /tmp/$name
	/tmp/$name
    rm /tmp/$name
end

function my_clear 
    clear
    pokemon-colorscripts -r --no-title && echo $my_prompt
    commandline -f repaint
end

function my_ls
    echo
    g --icon
    commandline -f repaint
end

function nvim-fzf
    set filename $(fzf-tmux)
    if test $status -eq 0
        nvim $filename
    end
end


function kinit
	eval $(keychain --quiet --eval $argv)
end


### ENV
set -a fish_user_paths $HOME/.local/bin $HOME/go/bin
set HOME /home/lemonade
set -Ux EDITOR nvim
set -U fish_cursor_default block
set -U fish_cursor_insert block
set -U PGHOST /tmp
set -U XDG_CONFIG_HOME $HOME/.config
set LANG en_US.UTF-8
set LC_ALL en_US.UTF-8
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
# set -Ux QT_QPA_PLATFORMTHEME gtk3
# set -Ux QT_STYLE_OVERRIDE gtk2



# opam configuration
source /home/lemonade/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# cargo
source "$HOME/.cargo/env.fish" >> /dev/null

# pnpm
set -gx PNPM_HOME "/home/lemonade/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -gx NVM_DIR "$HOME/.nvm"
test -s "$NVM_DIR/nvm.fish" && source "$NVM_DIR/nvm.fish" 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/lemonade/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/home/lemonade/Downloads/google-cloud-sdk/path.fish.inc'; end
