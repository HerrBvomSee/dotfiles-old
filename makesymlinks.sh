#!/bin/bash
# make script for personal dotfiles

dir=~/dotfiles
backup_dir=~/dotfiles_backup

files="bashrc vimrc bash_profile hgignore_global gitignore_global zshrc"

echo "Creating $backup_dir for exisiting dotfiles in ~"
mkdir -p $backup_dir
echo "done"

echo "Changing to $dir directory"
cd $dir
echo "done"

for file in $files; do
    echo "Moving $file from ~ to $backup_dir"
    mv ~/.$file $backup_dir/
    echo "Symlinking $file in ~"
    ln -s $dir/$file ~/.$file
done

