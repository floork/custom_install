#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

install_yay(){
  git clone https://aur.archlinux.org/yay-bin
  cd yay-bin
  makepkg -si
}
install_ly(){
  chmod +x ~/.xinitrc
  sudo pacman -S ly
  sudo systemctl enable ly.service
  sudo systemctl start ly.service
}
install_hyprland(){
    yay -S hyprland-bin polkit-gnome ffmpeg neovim viewnior dunst rofi pavucontrol thunar starship wl-clipboard wf-recorder swaybg grimblast-git ffmpegthumbnailer tumbler playerctl noise-suppression-for-voice thunar-archive-plugin kitty waybar-hyprland wlogout swaylock-effects sddm-git nwg-look-bin nordic-theme papirus-icon-theme pamixer
}
copy_confs(){
  cp $SCRIPT_DIR/dotconfig ~/.config
}

install_yay()
install_ly()
install_hyprland()
copy_confs()
