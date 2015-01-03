#echo "bash_profile"

[ -r ~/.local/`uname`.bash_profile ] && . ~/.local/`uname`.bash_profile
[ -r ~/.local/`hostname -s`.bash_profile ] && . ~/.local/`hostname -s`.bash_profile
[ -r ~/.profile ] && . ~/.profile
[ -r ~/.bashrc ] && . ~/.bashrc
