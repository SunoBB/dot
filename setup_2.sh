# If you want same me.

# Install themes, mouse, thunar, kitty, font
#  /usr/share/fonts -font
#  /usr/share/icons/ -mouse cursor
#  /usr/share/icons/  - thunar file
# .config/gtk-3.0/settings.ini - setting lxappearen
# https://github.com/catppuccin/kitty - themes kitty

Red='\e[0;31m';
Gre='\e[0;32m';
Cya='\e[0;36m';
Whi='\e[0;37m';



echo -e "[${Red}*${Whi}] Themes Mouse, Thunar, fonts"
# cd  dot/lxappearance/
cp -r dot/lxappearance/Catppuccin-Frappe-Blue-Cursors /usr/share/icons/
cp -r dot/lxappearance/TokyoNight-SE /usr/share/icons/
cp -r dot/.font  /usr/share/fonts

sudo chown -R $USER $HOME
