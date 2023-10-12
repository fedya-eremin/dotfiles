set fish_greeting
if status is-interactive
	pokemon-colorscripts -n charmander --no-title
end
# NOTE: to get rid of poetry completion error, run:
# poetry completions fish > ..../fish/vendor_completions.d/poetry.fish
# because it seems to be kinda fucked up by default

bind \cz ''
bind \cf 'nvim $(fzf-tmux -h)'
bind \ek 'echo "" ; clear; pokemon-colorscripts -r --no-title ; fish_prompt ; '

function my_clear 
    set my_prompt $(fish_prompt)
    clear
    pokemon-colorscripts -r --no-title && echo $my_prompt

end

if status is-login
and not set -q TMUX
    sway
end

if status is-interactive 
and not set -q TMUX
    systemctl --user start tmux && tmux start-server && tmux run ~/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux a
end

alias lsa="ls -la"
alias ll="ls -l"
alias cls="clear ; pokemon-colorscripts -r --no-title"
alias listn="nmcli device wifi list"
alias connect="nmcli device wifi connect "
alias activate="source ./venv/bin/activate.fish"
alias rmr="rm -r"
alias rmrf="rm -rf"
alias rmf="rm -f"
alias dog="cat"
alias vim="nvim"
alias cicd="flake8 . && pytest"


function mkcd
	mkdir -p $argv;
	cd $argv;
end

function runc
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

function kinit
	eval $(keychain --quiet --eval $argv)
end
fish_add_path -a $HOME/.local/bin $HOME/dotfiles/scripts/ #:/usr/lib/docker/cli-plugins/
set HOME /home/lemonade
set -Ux EDITOR nvim


set -U fish_cursor_default block
set -U fish_cursor_insert block

# opam configuration
source /home/lemonade/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
