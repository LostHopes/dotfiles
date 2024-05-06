#!/bin/sh

dotfiles(){

    CONFIG_PATH=$(pwd)/.config
    LOCAL_PATH=$(pwd)/.local/share


    echo moving dots...
    for item in $(\ls $CONFIG_PATH)
    do
        if [[ -d $HOME/.config/$item || -f $HOME/.config/$item ]]; then
            echo $item exist
        else
            echo moving $item to $HOME/.config
            cp -rt "$HOME/.config" "$(pwd)/.config/$item"
        fi
    done

    for loc in $(\ls $LOCAL_PATH)
    do
        if [[ -d $HOME/.local/$loc || -f $HOME/.config/$loc ]]; then
            echo $loc exist
        else
            echo moving $loc to $LOCAL_PATH
            cp -rt $HOME/.local "$LOCAL_PATH/fonts"
        fi
    done
}

install(){
    yay -S $(< packages.txt) --needed
}

clean(){
    echo -e "\nHere is files to delete" && ls -lah
    #rm -r $(pwd)
}

read -p "Do you really want to install dotfiles? (y/n):" install
case $install in
    [Yy]* ) dotfiles; break;;
    [Nn]* ) echo "Exiting..."; exit 1; break;;
    * ) echo "Please answer yes or no.";;
esac
