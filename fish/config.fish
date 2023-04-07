if status is-interactive
	pokemon-colorscripts -n charmander --no-title
end


if status is-login
	exec Hyprland
end


alias lsa="ls -la"
alias ll="ls -l"
alias clear="clear ; pokemon-colorscripts -n charmander --no-title"
alias listn="nmcli device wifi list"
alias connect="nmcli device wifi connect "
alias activate="source ./venv/bin/activate.fish"
alias rmr="rm -r"
alias mirrorscreen="wl-mirror -c HDMI-1 &"
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
set PATH $PATH:/home/lemonade/.local/bin
set HOME /home/lemonade


