set fish_greeting
set TERM alacritty
set EDITOR steam-run nvim
if status is-interactive
	pokemon-colorscripts -n charmander --no-title
    carapace _carapace | source
end
# NOTE: to get rid of poetry completion error, run:
# poetry completions fish > ..../fish/vendor_completions.d/poetry.fish
# because it seems to be kinda fucked up by default

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

bind \cz ''
bind -s \ek 'my_clear'
bind \el 'my_ls'
bind \cf 'nvim $(fzf-tmux)'


if status is-login
and not set -q TMUX
    env XDG_CURRENT_DESKTOP=sway dbus-run-session sway
end

alias lsa="g -l -a --icons"
alias ll="g -l --icons"
alias cls="clear ; pokemon-colorscripts -r --no-title"
alias listn="nmcli device wifi list"
alias connect="nmcli device wifi connect "
alias activate="source ./venv/bin/activate.fish"
alias rmr="rm -r"
alias rmrf="rm -rf"
alias rmf="rm -f"
alias dog="cat"
alias vi="nvim"
alias cicd="flake8 . && pytest"
alias sudoe="sudoedit"
alias iamatomic="sudo nixos-rebuild switch"
alias feh="feh --scale-down --geometry 1000x800"
# alias conda=" $HOME/anaconda3/bin/conda"


function mkcd
	mkdir -p $argv;
	cd $argv;
end

# function runc
# 	set name $(string sub -e -2 $argv).out
# 	clang -Wall $argv -o /tmp/$name
# 	/tmp/$name
#     rm /tmp/$name
# end
#
#
# function runcpp
# 	set name $(string sub -e -2 $argv).out
# 	clang++ -Wall -std=c++20 $argv -o /tmp/$name
# 	/tmp/$name
#     rm /tmp/$name
# end

function kinit
	eval $(keychain --quiet --eval $argv)
end
set -a fish_user_paths $HOME/.local/bin $HOME/.ghcup/bin/
set HOME /home/lemonade
set -Ux EDITOR nvim


set -U fish_cursor_default block
set -U fish_cursor_insert block

# opam configuration
source /home/lemonade/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
function condaenv
    if test -f /opt/anaconda/bin/conda
        eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
    end
end
# <<< conda initialize <<<

alias info="info --vi-keys"
