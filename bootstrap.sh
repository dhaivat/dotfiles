#!/bin/bash

if [[ $(uname) == 'Darwin' ]]; then
	echo "Mac OS X detected: installing homebrew"
	read -rp "Mac OS X detected: install homebrew and some useful packages? " b_yn
	case $b_yn in
	[Yy]*)
		which brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		brew tap caskroom/cask
		brew install brew-cask
		while read -r line; do
			brew install "$line"
		done <frozen.brew
		while read -r line; do
			HOMEBREW_CASK_OPTS="--appdir=/Applications" brew cask install "${line}"
		done <frozen.cask
		;;
	[Nn]*)
		echo "OK, not installing"
		;;
	esac
else
	read -rp "Install tmux, fish, vim? " t_yn
	case $t_yn in
	[Yy]*)
		case $(lsb_release -i | cut -d':' -f2 | tr -d '\t') in
		'CentOS')
			sudo yum install tmux fish neovim
			;;
		'Debian' | 'Ubuntu')
			sudo apt-get install tmux fish neovim
			;;
		esac
		;;
	[Nn]*)
		echo "Not installing zsh and tmux"
		;;
	esac
	echo "Seems like you are using this not on a Mac"
	echo "Disabling userspace reattatch"
fi

epoch=$(date +"%s")
for i in $HOME/.tmux $HOME/.tmux.conf; do
	if [[ (-e $i) || (-L $i) ]]; then
		echo "renaming ${i} to ${i}.old"
		mv "${i}" "${i}.${epoch}.old" || die "Could not move ${i} to ${i}.old"
	fi
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tic xterm-256color-italic.terminfo
ln -sfv ${PWD}/tmux.conf ${HOME}/.tmux.conf
ln -sfv ${PWD}/nvim ${HOME}/.config/nvim
ln -sfv ${PWD}/fish ${HOME}/.config/fish
ln -sfv ${PWD}/wezterm.lua ${HOME}/.wezterm.lua

read -rp "Changing default shell to fish, OK? " yn
case $yn in
[Yy]*) chsh -s "$(which fish)" ;;
[Nn]*) echo "Ok" ;;
esac
