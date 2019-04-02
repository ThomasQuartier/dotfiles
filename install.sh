#!/bin/bash

dir=~/.dotfiles
olddir=~/.dotfiles_old
files="zshrc tmux.conf gitconfig gitignore_global"

echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# Config files in home folder
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Neovim config files
mkdir -p ~/.config/nvim/
echo "Moving any existing dotfiles from ~ to $olddir"
mv ~/.config/nvim/init.vim $olddir/
mv ~/.config/nvim/coc-settings.json $olddir/
echo "Creating symlink to init.vim in nvim directory."
ln -s $dir/init.vim ~/.config/nvim/init.vim
ln -s $dir/coc-settings.json ~/.config/nvim/coc-settings.json
