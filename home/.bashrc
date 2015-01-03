# exit if non-interactive shell
[[ $- != *i* ]] && return

#echo "bashrc"

[ -r ~/.local/`uname`.bashrc ] && . ~/.local/`uname`.bashrc
[ -r ~/.local/`hostname -s`.bashrc ] && . ~/.local/`hostname -s`.bashrc

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick --quiet refresh
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"