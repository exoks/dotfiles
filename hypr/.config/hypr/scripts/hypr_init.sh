#  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀               𓐓 hypr_init.sh 𓐔         
#  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
#  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀  Engineer: oezzaou <oussama.ezzaou@gmail.com>
#  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
#  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
#  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2026/01/21 16:31:53 by oezzaou
#  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2026/01/21 17:48:22 by oezzaou
#  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
#  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
#  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
#  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

# ===[ hypr_init: script ]=====================================================
#!/bin/bash

# NOTE:> packages 
WALLPAPERS=~/dotfiles/hypr/.config/backgrounds
SWWW_DAEMON="swww-daemon"
SWWW="swww"
DEFAULT=~/.config/backgrounds/Img-9.png
WAYBAR="waybar"
ROFI="rofi"
HYPRLOCK="hyprlock"
# HYPRPAPER="hyprpaper"

# NOTE:> check if the WAYBAR exist otherwise install it
if ! pacman -Qi $WAYBAR &>/dev/null; then
  echo "auto_start: $WAYBAR
  not found. Installing..."
  pacman -S --noconfirm $WAYBAR
else
  echo "auto_start: $WAYBAR is already installed."
fi

# # NOTE:> check if HYPRPAPER exist otherwise install it
# if ! pacman -Qi $HYPRPAPER &>/dev/null; then
#   echo "auto_start: $HYPRPAPER not found. Installing..."
#   pacman -S --noconfirm $HYPRPAPER
# else
#   echo "auto_start: $HYPRPAPER is already installed."
# fi

# NOTE:> check if HYPRLOCK exist otherwise install it
if ! pacman -Qi $HYPRLOCK &>/dev/null; then
  echo "auto_start: $HYPRLOCK not found. Installing..."
  pacman -S --noconfirm $HYPRLOCK
else
  echo "auto_start: $HYPRLOCK is already installed."
fi

# NOTE:> check if ROFI exist otherwise install it
if ! pacman -Qi $ROFI &>/dev/null; then
  echo "auto_start: $ROFI not found. Installing..."
  pacman -S --noconfirm $ROFI
else
  echo "auto_start: $ROFI is already installed."
fi

# NOTE:> Check if SWWW exist otherwise install it
if ! pacman -Qi $SWWW &>/dev/null; then
  echo "auto_start: $SWWW not found. Installing..."
  pacman -S --noconfirm $SWWW
else
  echo "auto_start: $SWWW is already installed."
fi

# NOTE:> Ensure swww-daemon is running 
# HINT:> redirect the output to another file / good way to hide the input
ps aux | grep -v "grep" | grep ${SWWW_DAEMON} > /dev/null
if [ $? -eq 0 ]; then
  echo "auto_start: Daemon is already running."
else
  echo "auto_start: Daemon is not running."
  swww-daemon
fi
