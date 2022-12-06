

sudo pacman -S git thunar adobe-source-code-pro-fonts material-gtk-theme arandr feh thunar rofi spotify ttf-font-awesome visual-studio-code-bin gotop htop picom flameshot playerctl picom-pijulius-git zsh tty-clock-git i3status lxappearance ttf-fira-code tk bluez bluez-utils pulseaudio-bluetooth 
yay -S zsh-autosuggestions zip github-desktop-bin bzip2 eww ttf-material-design-icons-extended adobe-source-code-pro-fonts  wps-office  python-wxpython termcolor figlet otf-japanese-radicals-font ttf-jetbrains-mono nerd-fonts-jetbrains-mono ttf-material-icons-git ncmpcpp ranger yay -S brightness-controller-git python-pip 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
 
# Yay
git clone https://aur.archlinux.org/yay.git && cd yay  && makepkg -si


# driver
yay -S lshw inxi

sudo inxi --width 80 --system --graphics

sudo lshw -class display

yay -S mesa-utils

yay -S mesa xf86-video-intel vulkan-intel

yay -S lightdm lightdm-gtk-greeter

sudo systemctl enable lightdm.service

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

# Dot 
git clone https://github.com/SunoBB/dot
git clone https://github.com/porudev/rofi-nord

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \\n    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# eww 
git clone https://github.com/elkowar/eww && cd eww  && cargo build --release && cd target/release && chmod +x ./eww && ./eww daemon && ./eww open dashboard


sudo systemctl enable betterlockscreen@$user
sudo chown -R $USER $HOME
