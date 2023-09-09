if status is-interactive
	pokemon-colorscripts -n charmander --no-title
    eval (starship init fish)
end


if status is-login
and not set -q TMUX
    startx
end

if status is-interactive 
and not set -q TMUX
    tmux start-server && tmux run ~/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux a
end

alias lsa="ls -la"
alias ll="ls -l"
alias clear="clear ; pokemon-colorscripts -r --no-title"
alias listn="nmcli device wifi list"
alias connect="nmcli device wifi connect "
alias activate="source ./venv/bin/activate.fish"
alias rmr="rm -r"
alias rmrf="rm -rf"
alias rmf="rm -f"
alias dog="cat"

function mkcd
	mkdir -p $argv;
	cd $argv;
end

function runc
	set name $(string sub -e -2 $argv).out
	gcc $argv -o /tmp/$name
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
set PATH $PATH:$HOME/.local/bin:$HOME/dotfiles/scripts/ #:/usr/lib/docker/cli-plugins/
set HOME /home/lemonade
set EDITOR nvim


bind \cq 'tmux new -s 0'
bind \cz ''
set -U fish_cursor_default block
set -U fish_cursor_insert block

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/lemonade/.ghcup/bin # ghcup-env

# opam configuration
source /home/lemonade/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
