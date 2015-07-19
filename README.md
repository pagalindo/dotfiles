# dotfiles

## General Installation

cp ~/dotfiles/.vim/colors/* ~/.vim/colors

git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

chsh -s /bin/zsh

while in zsh:
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

source ~/dotfiles/zshfonfig.sh

brew install tmux; brew install reattach-to-user-namespace

source ~/dotfiles/make.sh

Update vim to latest version

:PluginInstall

tmux source-file ~/.tmux.conf; tmux source-file ~/.tmux_statusbar.conf

## Configuration

add git module to .zpreztorc

remove aliases from ~/.zprezto/modules/git/alias.zsh

add promt to .zpreztorc. Good themes: sorin, damoekri, peepcode, minimal, giddie, paradox

install jsctags (https://github.com/mozilla/doctorjs)
