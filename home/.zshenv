#echo "zshenv"

[ -r ~/.config/dotfiles/`uname`.zshenv ] && . ~/.config/dotfiles/`uname`.zshenv
[ -r ~/.config/dotfiles/`hostname -s`.zshenv ] && . ~/.config/dotfiles/`hostname -s`.zshenv