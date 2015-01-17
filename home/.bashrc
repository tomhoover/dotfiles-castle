# exit if non-interactive shell
[[ $- != *i* ]] && return

#echo "bashrc"

for file in ~/.config/dotfiles/{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -r ~/.config/dotfiles/`uname`.bashrc ] && . ~/.config/dotfiles/`uname`.bashrc
[ -r ~/.config/dotfiles/`hostname -s`.bashrc ] && . ~/.config/dotfiles/`hostname -s`.bashrc

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick --quiet refresh
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"

#rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi