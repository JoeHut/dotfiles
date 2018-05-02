#!/usr/bin/env bash

set -x

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
CONFIG_DIR=$HOME/.config
CONFIG_DIR_BAK=$CONFIG_DIR.bak

if [ -d "$CONFIG_DIR" ]; then
  if [ -L "$CONFIG_DIR" ]; then
    # directory is just a symlink. Unexpected so exit
    echo ".config is just a symlink. Take care manually."
    exit -1
  else
    if [ -d "$CONFIG_DIR_BAK" ]; then
      echo "Backup of config directory already exists. Take care manually"
      exit -1
    fi

    cp -r $CONFIG_DIR $CONFIG_DIR_BAK
  fi
else
  mkdir -p $CONFIG_DIR
fi


ln -s $SCRIPTPATH/i3 $CONFIG_DIR
ln -s $SCRIPTPATH/i3blocks $CONFIG_DIR
ln -s $SCRIPTPATH/terminator $CONFIG_DIR
ln -s $SCRIPTPATH/.vim $HOME
ln -s $SCRIPTPATH/.vimrc $HOME/.vimrc
ln -s $SCRIPTPATH/.vim/init.vim $SCRIPTPATH/.vimrc
