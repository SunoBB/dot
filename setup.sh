
git clone https://github.com/SunoBB/dot


# Git
git
github-desktop-bin

# 
thunar
feh
rofi
neovim
gvfs 
thunar-volman
openasar-git

# App
visual-studio-code-bin
spotify
flameshot
wps-office
brightness-controller-git
discord
# https://aur.archlinux.org/packages/redact-bin : tool delete

# Zip/Unzip file
zip
bzip2

# 
material-gtk-theme
lxappearance




# for rice
gotop
htop
ncmpcpp
figlet
ranger
playerctl
tty-clock-git
i3status
git clone https://github.com/jaseg/lolcat.git\ncd lolcat\nmake && sudo make install


picom-pijulius-git / picom

# font
ttf-japanese-radicals-font
ttf-jetbrains-mono
nerd-fonts-jetbrains-mono
ttf-material-icons-git
ttf-material-design-icons-extended
adobe-source-code-pro-fonts
ttf-font-awesome
ttf-fira-code

# For py

python-wxpython
python-pip
tk

# Zsh
yay -S zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update
exec zsh
# Package for zsh:
yay -S fzf exa

# add themes
# in dot/.config/zsh

# Yay
git clone https://aur.archlinux.org/yay.git && cd yay  && makepkg -si


# driver
yay -S lshw inxi

sudo inxi --width 80 --system --graphics

sudo lshw -class display

yay -S mesa-utils

yay -S mesa xf86-video-intel vulkan-intel

# Dont need sudo [startx, reboot, poweroff, ...]
yay -S lightdm lightdm-gtk-greeter

sudo systemctl enable lightdm.service

# Change avatar in lightdm
yay -S accountsservice
sudo chmod 755 -R /var/lib/AccountsService

sudo chmod 777 /Path/to/Img
sudo cp -v /Path/to/Img /var/lib/AccountsService/icons/.png

sudo nvim  /var/lib/AccountsService/users/user
Change: Icon=/var/lib/AccountsService/icons/.png

# Battery
yay -S xfce4-power-manager


# sound
yay -S pipewire pipewire-pulse helvum pavucontrol pipewire-alsa 
systemctl --user enable pipewire pipewire-pulse

systemctl --user start pipewire pipewire-pulse

# Key

yay -S ibus ibus-bamboo

# I3-gaps
yay -S i3-gaps


# bar

yay -S polybar
yay -S eww

# or using eww
# eww 
git clone https://github.com/elkowar/eww && cd eww  && cargo build --release && cd target/release && chmod +x ./eww && ./eww daemon && ./eww open dashboard

# Dot 
git clone https://github.com/SunoBB/dot
git clone https://github.com/porudev/rofi-nord

# For nvim / vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \\n    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For mouse


# for Blue-tooth
sudo pacman -S bluez bluez-utils bluman

bluetoothctl

power on

agent on
default-agent 

scan on

devices 

trust [IP]
pair  [IP]
connect [IP]

scan off


sudo nvim /etc/bluetooth/main.conf 
Change
AutoEnable=True
# 


sudo systemctl enable betterlockscreen@$user
sudo chown -R $USER $HOME


