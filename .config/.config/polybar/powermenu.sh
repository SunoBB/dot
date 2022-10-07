#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Lock\n  Sleep" | rofi -dmenu -i -theme-str)

case "$chosen" in
	"  Power Off") systemctl poweroff ;;
	"  Restart") systemctl reboot ;;
	"  Lock") slock ;;
	"  Sleep") systemctl suspend ;;
	*) exit 1 ;;
esac
