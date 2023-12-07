#!/usr/bin/env bash

### chekear por sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "Este script debe ejecutarse con sudo, inténtalo de nuevo..."
  exit 1
fi

#actualizar
apt update -y && sudo apt upgrade -y

### Instalar xfce4 minimal
apt install -y \
    libxfce4ui-utils \
    xfce4-pulseaudio-plugin \
    xfce4-whiskermenu-plugin \
    xfce4-session \
    xfce4-settings \
    xfconf \
    xfdesktop4 \
    xfce4-panel \
    xfwm4 \
    xinit \
    qt5ct

### Instalar complementos
apt install -y linux-headers-$(uname -r) build-essential make ninja-build fuse automake pkg-config cmake autoconf git python3-pip g++ 
apt install -y libncurses-dev flex bison openssl libssl-dev dkms libelf-dev pkg-config liblz4-tool bc rsync debhelper dwarves
apt install -y intel-microcode
# apt install -y nvidia-driver

#paquetes del usuario
apt install --no-install-recommends -y kitty dunst libnotify-bin flameshot python3.11-venv ripgrep lxpolkit ntfs-3g

# ### paquetes externos del usuario

# #nvim
# cd
# wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
# chmod u+x nvim.appimage
# mv nvim.appimage /usr/bin/nvim

# #lsd command line
# cd
# wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
# dpkg -i lsd-musl_0.23.1_amd64.deb

# #nvm
# cd
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# #cargo
# cd
# curl https://sh.rustup.rs -sSf | sh

# #kepassxc
# cd
# wget https://github.com/keepassxreboot/keepassxc/releases/download/2.7.5/KeePassXC-2.7.5-x86_64.AppImage
# chmod u+x KeePassXC-2.7.5-x86_64.AppImage 
# mv KeePassXC-2.7.5-x86_64.AppImage /usr/bin/keepassxc

# #waterfox
# cd
# wget https://cdn1.waterfox.net/waterfox/releases/G5.1.9/Linux_x86_64/waterfox-G5.1.9.tar.bz2
# tar -xvf waterfox-G5.1.9.tar.bz2
# mv waterfox /opt

# #fonts
# cd 
# cp -r xfce-dotfiles/fonts/HackerNerdFonts/ /usr/share/fonts/
# cp -r xfce-dotfiles/fonts/FontsCascadia /usr/share/fonts/

# #themes
# cd
# cp -r xfce-dotfiles/themes/Sweet-Dark /usr/share/themes/

# #icons
# cd
# cp -r xfce-dotfiles/icons/kora /usr/share/icons/

# ### copy and paste files 
# cd ~/xfce-dotfiles/config
# cp -r kitty dunst nvim tint2 ~/.config/

apt autoremove -y
echo
echo Instalación de xfce completa, reinicie y emita 'startx'
echo

