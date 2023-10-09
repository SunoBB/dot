#!/usr/bin/env bash

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)

backup_folder=~/.RiceBackup
date=$(date +%Y%m%d-%H%M%S)

logo() {

	local text="${1:?}"
	echo -en "                                 
  Suno's dotfiles\n\n"
	printf ' %s [%s%s %s%s %s]%s\n\n' "${CRE}" "${CNC}" "${CYE}" "${text}"
}

# Check if this script is run as root
if [ "$(id -u)" = 0 ]; then
	echo "This script MUST NOT be run as root."
	exit 1
fi

# Intro
clear
logo "Welcome!"
printf '%s%sThis script will automatically install fully-featured tiling/floating window manager-based system on any Arch Linux or Arch-based system. \n\nMy dotfiles DO NOT modify any of your system configuration. \nYou will be prompted for your root password to install missing dependencies and/or to switch to fish shell if its not your default. \n\nThis script doesnt have potential power to break your system, it only copies files from my repo to your HOME directory. %s\n\n' "${BLD}" "${CRE}" "${CNC}"

while true; do
	read -rp " Do you want to continue? [y/n]: " yn
	case $yn in
	[Yy]*) break ;;
	[Nn]*) exit ;;
	*) printf "Just write 'y' or 'n'\n\n" ;;
	esac
done
clear

# Update system
logo "Updating system"
sudo rm -rf /var/lib/pacman/db.lck
sudo pacman -Syu --noconfirm
sleep 1
clear

# Installing X.Org 
logo "Installing X.Org"
sudo pacman -S --needed --noconfirm xorg xorg-drivers
sleep 2 
clear

# Installing Pipewire (audio)
logo "Installing Pipewire (audio)"
yes y | sudo pacman -S --needed pipewire pipewire-pulse wireplumber
sleep 2 
clear

# Installing yay
logo "Installing yay and AUR packages"
if command -v yay &>/dev/null; then
	echo "Yay is installed in your system"
else
	echo "Installing yay"
	sudo pacman -S --needed --noconfirm base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm && cd
fi
sleep 2 
clear

# Install packages
logo "Installing needed packages"

dependencies=(git github-desktop-bin zsh thunar feh rofi neovim gvfs thunar-volman visual-studio-code-bin brave-bin flameshot brightness-controller-git discord zip bzip2 lxappearance gotop htop ncmpcpp mpd figlet ranger playerctl tty-clock i3status picom-pijulius-git fzf exa i3-gaps polybar ibus ibus-bamboo xfce4-power-manager bluez bluez-utils bluman betterlockscreen ytdownloader-gui ttf-jetbrains-mono-nerd)

is_installed() {
	pacman -Qi "$1" &>/dev/null
	return $?
}

printf "%s%sChecking for required packages%s\n" "${BLD}" "${CBL}" "${CNC}"
for paquete in "${dependencies[@]}"; do
	if ! is_installed "$paquete"; then
		yay -S --noconfirm "$paquete"
		printf "\n"
	else
		printf '%s%s is already installed on your system!%s\n' "${CGR}" "$paquete" "${CNC}"
	fi
done
sleep 1
clear

# Installing lolcat
logo "Installing lolcat"
cd
rm -rf ~/lolcat
git clone https://github.com/jaseg/lolcat.git && cd lolcat && make && sudo make install
sleep 1 
clear

# Preparing folders
logo "Preparing Folders"
if [ ! -e $HOME/.config/user-dirs.dirs ]; then
	xdg-user-dirs-update
	echo "Creating xdg-user-dirs"
else
	echo "user-dirs.dirs already exists"
fi
sleep 1
clear

# Downloading dotfiles
logo "Downloading dotfiles"
[ -d ~/dot ] && rm -rf ~/dot
printf "Cloning rice from https://github.com/SunoBB/dot\n"
cd
git clone --depth=1 https://github.com/SunoBB/dot.git
printf "Cloning rice from https://github.com/poyrudev/rofi-nord\n"
cd
git clone --depth=1 https://github.com/porudev/rofi-nord ~/.config/rofi-nord
print f "Cloning rice from https://github.com/Fausto-Korpsvart/Material-GTK-Themes\n"
cd
git clone --depth=1 https://github.com/Fausto-Korpsvart/Material-GTK-Themes
sleep 1
clear

# Backup dotfiles
logo "Backing-up dotfiles"
printf "Backup files will be stored in %s%s%s/.RiceBackup%s \n\n" "${BLD}" "${CRE}" "$HOME" "${CNC}"
sleep 1

if [ ! -d "$backup_folder" ]; then
	mkdir -p "$backup_folder"
fi

for folder in cava eww i3 i3status kitty mpd ncmpcpp neofetch nvim openbox picom polybar rofi tmux zsh; do
	if [ -d "$HOME/.config/$folder" ]; then
		mv "$HOME/.config/$folder" "$backup_folder/${folder}_$date"
		echo "$folder folder backed up successfully at $backup_folder/${folder}_$date"
	else
		echo "The folder $folder does not exist in $HOME/.config/"
	fi
done

printf "%s%sDone!!%s\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1
clear

# Installing dotfiles
logo "Installing dotfiles.."
printf "Copying files to respective directories..\n"

[ ! -d ~/.config ] && mkdir -p ~/.config
[ ! -d ~/.icons ] && mkdir -p ~/.icons
[ ! -d ~/.fonts ] && mkdir -p ~/.fonts
[ ! -d ~/.local/share/applications ] && mkdir -p ~/.local/share/applications

for archivos in ~/dot/.config/*; do
	cp -R "${archivos}" ~/.config/
	if [ $? -eq 0 ]; then
		printf "%s%s%s folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	else
		printf "%s%s%s failed to been copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
		sleep 1
	fi
done

for archivos in ~/dot/home/*; do
	cp -R "${archivos}" ~/
	if [ $? -eq 0 ]; then
		printf "%s%s%s folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	else
		printf "%s%s%s failed to been copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
		sleep 1
	fi
done

for archivos in ~/dot/lxappearance/*; do
	cp -R "${archivos}" ~/.icons/
	if [ $? -eq 0 ]; then
		printf "%s%s%s folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	else
		printf "%s%s%s failed to been copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
		sleep 1
	fi
done

for archivos in ~/dot/.font/*; do
	cp -R "${archivos}" ~/.fonts/
	if [ $? -eq 0 ]; then
		printf "%s%s%s folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	else
		printf "%s%s%s failed to been copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
		sleep 1
	fi
done

for archivos in ~/dot/background; do
	cp -R "${archivos}" ~/
	if [ $? -eq 0 ]; then
		printf "%s%s%s folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	else
		printf "%s%s%s failed to been copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
		sleep 1
	fi
done

for archivos in ~/Material-GTK-Themes/themes/*; do
	cp -R "${archivos}" ~/.themes/
	if [ $? -eq 0 ]; then
		printf "%s%s%s folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	else
		printf "%s%s%s failed to been copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
		sleep 1
	fi
done

printf "%s%sDone!\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1
clear

# Installing NvChad
[ -d ~/NvChad ] && rm -rf ~/NvChad
logo "Installing NvChad"
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim
cd
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
printf "%s%sDone!\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1
clear

# Configuring dotfiles
logo "Configuring dotfiles"
chmod -R +x ~/.config/
cp /etc/X11/xinit/xinitrc .xinitrc
touch ~/.Xresources
sudo fc-cache
printf "%s%sDone!\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1
clear

# Configuring zsh
logo "Configuring zsh"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit self-update

# Configuring pacman (for what???)
logo "Configuring pacman (for what???)"

grep "^Color" /etc/pacman.conf >/dev/null || sudo sed -i "s/^#Color$/Color/" /etc/pacman.conf
grep "ILoveCandy" /etc/pacman.conf >/dev/null || sudo sed -i "/#VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
printf "%s%sDone!\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1
clear

# Install LightDM
logo "Installing LightDM"
yay -S --needed --noconfirm lightdm lightdm-gtk-greeter
printf "%s%sDone!\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1

# Disable currently enabled display manager
if systemctl list-unit-files | grep enabled | grep -E 'gdm|lightdm|lxdm|lxdm-gtk3|sddm|slim|xdm'; then
	echo "Disabling currently enabled display manager"
	sudo systemctl disable $(systemctl list-unit-files | grep enabled | grep -E 'gdm|lightdm|lxdm|lxdm-gtk3|sddm|slim|xdm' | awk -F ' ' '{print $1}')
fi

echo "Enabling LightDM"
sudo systemctl enable lightdm
printf "%s%sDone!%s\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1
clear

# Enabling services
logo "Enabling services"

systemctl --user enable mpd.service
systemctl --user start mpd.service
sudo systemctl enable NetworkManager
systemctl --user enable pipewire pipewire-pulse wireplumber
printf "%s%sDone!%s\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1
clear

# Remove unneeded files
logo "Removing unneeded files"
rm -rf ~/dot
printf "%s%sDone!%s\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 1
clear

yay -S --noconfirm pipewire pipewire-pulse helvum pavucontrol pipewire-alsa 
systemctl --user enable pipewire pipewire-pulse
systemctl --user start pipewire pipewire-pulse




# Reupdate
yay -Syu
sudo chown -R $USER $HOME

