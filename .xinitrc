exec start-newm -d
#exec startgnome-session
#exec i3 --force-xinerama -V >> ~/.dotfiles/config/i3/i3.log 2>&1
#exec xfce4-session

#if [[ -d /sys/class/power_supply/BAT* ]]; then 
#    # If notebook
#    exec i3 -c ~/.config/i3/config.notebook
#else
#    # If desktop
#    xset -s off
#    exec i3 -c ~/.config/i3/config 
#fi
