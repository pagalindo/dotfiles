# dotfiles

cp ~/dotfiles/.vimrc ~/

cp ~/dotfiles/.vim/colors/bubblegum.vim ~/.vim/colors

git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim

:PluginInstall

Update vim to latest version

chsh -s /bin/zsh

while in zsh:
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

add .zhrc to ~/

brew install tmux
brew install reattach-to-user-namespace

cp ~/dotfiles/.tmux.conf ~/

cp ~/dotfiles/.tmux_statusbar.conf ~/

tmux source-file ~/.tmux.conf

tmux source-file ~/.tmux_statusbar.conf
