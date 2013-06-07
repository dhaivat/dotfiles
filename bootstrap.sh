#!/bin/bash

if [[ `uname` == 'Darwin' ]]; then
    echo "Mac OS X detected: installing homebrew"
    read -p "Mac OS X detected: install homebrew and some useful packages? " b_yn
    case $b_yn in
        [Yy]* )
            which brew || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
            while read line
            do
                brew install $line
            done < frozen.brew
            ;;
        [Nn]* )
            echo "OK, not installing"
            ;;
    esac
else
    read -p "Install tmux, zsh, vim? " t_yn
    case $t_yn in
        [Yy]* )
            case `lsb_release -i | cut -d':' -f2 | tr -d '\t'` in
                'CentOS')
                    sudo yum install tmux zsh vim
                    ;;
                'Ubuntu')
                    sudo apt-get install tmux zsh vim
                    ;;
            esac
            ;;
        [Nn]* )
            echo "Not installing zsh and tmux"
            ;;
    esac
    echo "Seems like you are using this not on a Mac"
    echo "Disabling userspace reattatch"
    sed -i "s/^set-option/#set-option/" tmux/tmux.conf
fi

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

read -p "Changing default shell to zsh, OK?" yn
case $yn in
    [Yy]* ) chsh -s $(which zsh); ;;
    [Nn]* ) echo "Ok"; ;;
esac

echo -e "p.s. I've tested this on tmux 1.8,
if you see errors like,
    \e[00;32musage: bind-key [-cnr] [-t key-table] key command [arguments][0/0]
    unknown option: pane-base-index
    unknown option: window-status-activity-attr\e[00m]
consider upgrading to 1.8 or comment out lines from tmux.conf
"
