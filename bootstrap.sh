#!/bin/sh

which brew || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

while read line
do
    brew install $line
done < frozen.brew

for i in $HOME/.tmux $HOME/.tmux.conf $HOME/.zshrc $HOME/.screenrc $HOME/.vim $HOME/.vimrc; do
    if [[ ( -e $i ) || ( -h $i ) ]]; then
        echo "renaming ${i} to ${i}.old"
        mv "${i}" "${i}.old" || die "Could not move ${i} to ${i}.old"
    fi
done

ln -s $PWD/oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
ln -s $PWD/tmux/tmux.conf $HOME/.tmux.conf
ln -s $PWD/screenrc $HOME/.screenrc
ln -s $PWD/vim $HOME/.vim
ln -s $PWD/vimrc $HOME/.vimrc
