#!/bin/bash

# Reece Hughes
files=$(ls -a | grep -e "^\.[a-zA-Z]")
dotDir=$(pwd)
backupDir=$HOME/.dotfiles_backup
verbose=false
backup=false


while true ; do
    case "$1" in
        -h|--help|\?)
            echo "Creates symlinks of all dotfiles in current directory"
            echo " to your home directory"
            echo "-v --verbose       More logging"
            echo "-b --backup        Makes backup to $backupDir or DIR"
            exit 1;
            shift ;;
        -v|--verbose) verbose=true ; shift ;;
        -b|--backup) backup=true ; shift ;;
        --) shift ; break ;;
        *) break ;;
    esac
done

if $backup ; then
    mkdir $backupDir
fi

for file in $files ; do
    if $backup ; then
        if $verbose ; then
            echo "Backing up $HOME/$file $backupDir"
        fi
        mv $HOME/$file $backupDir
    fi
    if $verbose ; then
        echo "Linking $dotDir/$file $HOME/$file"
    fi
    ln -sf $dotDir/$file $HOME/$file
done
