#!/usr/bin/env bash

### chekear por sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "Este script debe ejecutarse con sudo, inténtalo de nuevo..."
  exit 1
fi

#anñadir sources list
rm -Rf /etc/apt/sources.list
cp -r ~/xfce-dotfiles/sources-list/sources.list /etc/apt/

#añadir zram files
rm -Rf /etc/default/zramswap
cp -r ~/xfce-dotfiles/zram/zramswap /etc/default/

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
    xfwm4 \
    xinit \
    qt5ct

### Instalar complementos
apt install -y linux-headers-$(uname -r) build-essential make automake pkg-config cmake autoconf git curl wget unzip unrar tar gzip python3-pip
apt install -y libncurses-dev flex bison openssl libssl-dev dkms libelf-dev pkg-config liblz4-tool bc rsync
apt install -y intel-microcode
apt install -y nvidia-driver

#paquetes del usuario
apt install --no-install-recommends -y kitty fuse nemo ripgrep dunst libnotify-bin dmenu flameshot eog evince tint2 zram-tools

### paquetes externos del usuario

#nvim
cd
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage /usr/bin/nvim

#lsd command line
cd
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
dpkg -i lsd-musl_0.23.1_amd64.deb

#nvm
cd
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

#cargo
cd
curl https://sh.rustup.rs -sSf | sh

#kepassxc
cd
wget https://github.com/keepassxreboot/keepassxc/releases/download/2.7.5/KeePassXC-2.7.5-x86_64.AppImage
chmod u+x KeePassXC-2.7.5-x86_64.AppImage 
mv KeePassXC-2.7.5-x86_64.AppImage /usr/bin/keepassxc

#waterfox
cd
wget https://cdn1.waterfox.net/waterfox/releases/G5.1.9/Linux_x86_64/waterfox-G5.1.9.tar.bz2
tar -xvf waterfox-G5.1.9.tar.bz2
mv waterfox /opt

#fonts
cd 
cp -r xfce-dotfiles/fonts/HackerNerdFonts/ /usr/share/fonts/
cp -r xfce-dotfiles/fonts/FontsCascadia /usr/share/fonts/

#themes
cd
cp -r xfce-dotfiles/themes/Sweet-Dark /usr/share/themes/

#icons
cd
cp -r xfce-dotfiles/icons/kora /usr/share/icons/

### copy and paste files 
cd ~/xfce-dotfiles/config
cp -r kitty dunst nvim tint2 ~/.config/

apt autoremove -y
echo
echo Instalación de xfce completa, reinicie y emita 'startx'
echo

