#!/bin/sh

mv_dots(){

    CONFIG_PATH=$(pwd)/.config
    LOCAL_PATH=$(pwd)/.local


    echo moving dots...
    for item in $(\ls $CONFIG_PATH)
    do
        if [[ -d $HOME/.config/$item || -f $HOME/.config/$item ]]; then
            echo $item exists
        else
            echo moving $item to $HOME/.config
            cp -rt "$HOME/.config" "$(pwd)/.config/$item"
        fi
    done
}


read -p "Do you really want to install dotfiles? (y/n):" answer
case $answer in
    [Yy]* ) mv_dots; break;;
    [Nn]* ) echo "Exiting..."; break;;
    * ) echo "Please answer yes or no.";;
esac

