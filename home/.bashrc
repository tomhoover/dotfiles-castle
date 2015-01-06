# exit if non-interactive shell
[[ $- != *i* ]] && return

#echo "bashrc"

[ -r ~/.config/dotfiles/`uname`.bashrc ] && . ~/.config/dotfiles/`uname`.bashrc
[ -r ~/.config/dotfiles/`hostname -s`.bashrc ] && . ~/.config/dotfiles/`hostname -s`.bashrc

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
homeshick --quiet refresh