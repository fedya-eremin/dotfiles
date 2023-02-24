if status is-interactive
	pokemon-colorscripts -n charmander --no-title

	eval $(keychain --eval --quiet mirror)
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
alias keyinit="keychain --eval --agents ssh"
alias keval="keychain --eval"


function mkcd
	mkdir -p $argv;
	cd $argv;
end

set PATH $PATH:/home/main/.local/bin
