#!/bin/zsh
dotfiles_directory=~/dotfiles
cd $dotfiles_directory
dotfiles=$(find . -type f | grep -e "^\./\.[a-zA-Z0-9\._]*$")

for file in $(echo $dotfiles | cut -c 3-); do
  rm -rf ~/$file
  ln -sfv $dotfiles_directory/$file ~/$file
done
