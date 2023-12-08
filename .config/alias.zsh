if [ $(command -v exa) ]; then
    alias ll="exa --all --long --icons --group --git"
    alias ls="exa"
    alias la="exa --long --all --group"
fi

if [ $(command -v ripgrep) ]; then
    alias grep="ripgrep"
fi

if [ $(command -v udisksctl) ]; then
    alias mount-iso="udisksctl loop-setup -r -f"
    alias unmount-iso="udisksctl loop-delete -b"
    alias mount-ssd="udisksctl mount -b /dev/nvme0n1p1"
    alias unmount-ssd="udisksctl unmount -b /dev/nvme0n1p1"
fi

alias rec='ffmpeg -framerate 60 -f x11grab -i $DISPLAY  -pix_fmt yuv420p vid.mp4'
alias rec_high='ffmpeg -framerate 60 -f x11grab -i $DISPLAY -c:v libx264rgb -crf 0 -preset ultrafast -color_range 2 vid.mp4'

alias cls="clear"
alias la="ls -la"
alias nvide="neovide"

alias zedit="$EDITOR $HOME/.config/zsh/.zshrc"
alias fedit="$EDITOR $HOME/.config/fish/config.fish"

alias cclock="watch -t -n1 'date +%T | figlet' | lolcat"
alias tty-clock="tty-clock -S -c -C4 -D -s -n"
alias ccbonsai="cbonsai -ilt 0.02 -c '  ,  ,  ,  ,  ' -L 5"
alias fzi="$HOME/.fzfimg.sh"
alias fzr="fzf --layout=reverse --prompt ' ' --pointer '=>' --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"

alias yts="ytfzf -t"
alias startx='startx -- -keeptty >~/.xorg.log 2>&1'

alias cd..='cd ../'
alias cd...='cd ../../'
alias cd....='cd ../../../'
alias cd.....='cd ../../../../'
alias cd......='cd ../../../../../'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

alias rd='rmdir'
alias run-help='man'

alias grep='grep --color'
alias grepin='grep -i'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias -s pdf=zathura
alias -s ps=gv
alias -s dvi=xdvi
alias -s chm=xchm
alias -s djvu=djview

alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "

alias visudo="nvim /etc/sudoers"

alias upgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias upfnt='sudo fc-cache -fv'
alias kittythemes="kitty +kitten themes"

SILENT_JAVA_OPTIONS="$JDK_JAVA_OPTIONS"
alias java='java "$SILENT_JAVA_OPTIONS"'
alias nhist="dbus-monitor \"interface='org.freedesktop.Notifications'\" | grep --line-buffered \"member=Notify\|string\""
alias strel="xrdb -I$HOME/.config/Xresources $HOME/.config/Xresources/config.x && kill -USR1 $(pidof st)"

alias fet.sh="$HOME/.bin/eyecandy/fet.sh"
alias resrc="source $ZDOTDIR/.zshrc"
alias rofi-shot='rofi -show drun -normal-window & disown'

alias rel-xsettingsd="pkill -HUP xsettingsd"
alias fontcfg="font-config-info"

alias spotifyd="spotifyd --config-path '$HOME/.config/spotifyd/spotifyd.conf' --no-daemon"
alias luamake="$HOME/.opt/lua-language-server/3rd/luamake/luamake"

alias wttr='curl wttr.in'
alias c='cd $(fd --type d . | fzf)'

alias l1='exa -1'

alias panes="colorscript -e 34"
alias suno="figlet suno | lolcat -r"
alias lock="systemctl suspend && betterlockscreen -l dimblur"
alias py="python"
alias vim='nvim'
alias clock="tty-clock -c -s -C 4"
alias list_font="pango-list"
alias hdmi="xrandr --output HDMI1 --mode 1920x1080 --pos 0x0"
alias web="python -m http.server 8800"
# python -u "/home/suno/Caculator/Date/Check_date.py"

# vim:ft=zsh
