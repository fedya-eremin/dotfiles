if status is-interactive
	pokemon-colorscripts -n charmander --no-title
    eval (starship init fish)
end


if status is-login
    # startx
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
alias mirrorscreen="wl-mirror -Sc HDMI-1 &"
alias dog="cat"
alias sudo="doas"

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


