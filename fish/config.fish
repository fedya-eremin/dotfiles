if status is-interactive
	pokemon-colorscripts -n charmander --no-title
end


if status is-login
	#xinput set-prop 11 312 1
	#xinput set-prop 11 285 1
    # exec sway
    startx
end


alias lsa="ls -la"
alias ll="ls -l"
alias clear="clear ; pokemon-colorscripts -n charmander --no-title"
alias listn="nmcli device wifi list"
alias connect="nmcli device wifi connect "
alias activate="source ./venv/bin/activate.fish"
alias rmr="rm -r"
alias rmrf="rm -rf"
alias mirrorscreen="wl-mirror -Sc HDMI-1 &"
alias dog="cat"

function mkcd
	mkdir -p $argv;
	cd $argv;
end

function runc
	set name $(string sub -e -2 $argv).out
	gcc $argv -o $name
	./$name
    rm $name
end

function kinit
	eval $(keychain --quiet --eval $argv)
end
set PATH $PATH:$HOME/.local/bin:$HOME/dotfiles/scripts/ #:/usr/lib/docker/cli-plugins/
set HOME /home/lemonade


