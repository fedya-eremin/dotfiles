if status is-interactive
	pokemon-colorscripts -n charmander --no-title
end

if not status is-login
	eval $(keychain --eval --quiet key) 
end

if status is-login
	exec sway
end


alias lsa="ls -la"
alias ll="ls -l"
alias clear="clear ; pokemon-colorscripts -n charmander --no-title"
alias nigger="gnome-tweaks"
alias listn="nmcli device wifi list"
alias connect="nmcli device wifi connect "
alias activate="source ./venv/bin/activate.fish"
alias rmr="rm -r"
alias keyinit="eval $(keychain --eval --quiet key)"
alias keval="keychain --eval"
alias mirrorscreen="wl-mirror -c HDMI-1 &"

function mkcd
	mkdir -p $argv;
	cd $argv;
end

set PATH $PATH:/home/main/.local/bin
