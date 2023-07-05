# 

Red='\e[0;31m';
Gre='\e[0;32m';
Cya='\e[0;36m';
Whi='\e[0;37m';

# Check if this script is run as root
if [ "$(id -u)" = 0 ]; then
	echo "This script MUST NOT be run as root."
	exit 1
fi

# Synchronize package databases
echo -e "[${Red}*${Whi}] Updating system.."
sudo pacman -Syu --noconfirm

# Install git
sudo pacman -S --noconfirm --needed git

echo -e "[${Red}*${Whi}] Cloning dotfiles"
mkdir ~/GitGit
cd GitGit
git clone https://github.com/jaseg/lolcat.git\ncd lolcat\nmake && sudo make install
git clone https://github.com/SunoBB/dot
git clone https://github.com/poyrudev/rofi-nord
cd

# Install yay 
echo -e "[${Red}*${Whi}] install yay"
if command -v yay &>/dev/null; then
	echo "Yay is installed in your system"
else
	echo "Installing yay"
	sudo pacman -S --needed --noconfirm base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd ..
fi

# Install pkgs
echo -e "[${Red}+${Whi}] Installing repo packages"

is_installed() {
	pacman -Qi "$1" &>/dev/null
	return $?
}

for paquete in "$(cat  ~/GitGit/dot/.assets/pkg_lists/pkg_list)"; do
	if ! is_installed "$paquete"; then
		yay -S --noconfirm "$paquete"
		printf "\n"
	else
		printf '%s%s is already installed on your system!%s\n' "${Gre}" "$paquete"
	fi
done
sleep 1

# Setup zsh
echo -e "[${Gre}*${Whi}] Setting up ZSH plugins"

mkdir -p ~/.config/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
cd

cp -r dot/.config/zsh ~/.config/zsh

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

# Clone GTK theme(s) and icons
echo -e "[${Gre}*${Whi}] Cloning GTK theme, font and icons"

# Install driver for My lap (Suno)
echo -e "[${Red}] Read! If you realy need driver same me. [Y/N]"
read ans
if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
  yay -S --noconfirm inxi lshw
  sudo inxi --width 80 --system --graphics
  sudo lshw -class display
  yay -S --noconfirm mesa-utils
  yay -S --noconfirm mesa xf86-video-intel vulkan-intel
elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
		echo -e "Thanks for read"

# Enable 

# LightDm for start your Lap/PC
echo "[${Gre}*${Whi}] Installing LightDM"

yay -S --noconfirm lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

# Setup sound for Linux
echo "[${Gre}*${Whi}] Setup your sound"

yay -S --noconfirm pipewire pipewire-pulse helvum pavucontrol pipewire-alsa 
systemctl --user enable pipewire pipewire-pulse
systemctl --user start pipewire pipewire-pulse

# Reupdate
yay -Syu
sudo chown -R $USER $HOME

# Change shell to zsh
echo "[${Gre}*${Whi}] Changing shell to zsh"
chsh -s /usr/bin/zsh

