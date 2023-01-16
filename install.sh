#!/bin/bash

if [ -x "$(command -v pacman)" ]; then
        if [ -x "$(command -v yay)" ]; then
            yay -Syu --noconfirm
            yay -S awesome rofi picom i3lock-fancy xclip ttf-roboto polkit-gnome materia-theme lxappearance flameshot pnmixer network-manager-applet xfce4-power-manager qt5-styleplugins papirus-icon-theme qt5-styleplugins ly -y
            git clone https://github.com/ChrisTitusTech/titus-awesome ~/.config/awesome
        fi
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf -y upgrade --refresh
        sudo dnf copr enable fnux/ly
        sudo dnf -y install ly
    elif [ -x "$(command -v apt-get)" ]; then
        sudo apt-get -y update && sudo apt-get -y upgrade
        # ly
        sudo apt-get install build-essential libpam0g-dev libxcb-xkb-dev git -y
        git clone --recurse-submodules https://github.com/nullgemm/ly.git
        cd ly
        make
        sudo make run
        sudo make install
        sudo systemctl enable ly
        # awesome
        sudo apt install awesome fonts-roboto rofi compton i3lock xclip qt5-style-plugins materia-gtk-theme lxappearance xbacklight flameshot nautilus xfce4-power-manager pnmixer network-manager-gnome policykit-1-gnome qt5-style-plugins -y
        wget -qO- https://git.io/papirus-icon-theme-install | sh
        git clone --branch debian https://github.com/ChrisTitusTech/titus-awesome ~/.config/awesome
    else
        echo 'This Distro is not supported!'
    fi

mkdir -p ~/.config/rofi
cp $HOME/.config/awesome/theme/config.rasi ~/.config/rofi/config.rasi
sed -i '/@import/c\@import "'$HOME'/.config/awesome/theme/sidebar.rasi"' ~/.config/rofi/config.rasi

echo "XDG_CURRENT_DESKTOP=Unity" | sudo tee -a /etc/environment
echo "QT_QPA_PLATFORMTHEME=gtk2" | sudo tee -a /etc/environment
