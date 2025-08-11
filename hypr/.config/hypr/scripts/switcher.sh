#  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀             𓐓  switcher.sh 𓐔           
#  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
#  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀   Student: oezzaou </var/spool/mail/oezzaou> 
#  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
#  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
#  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2025/01/01 13:03:14 by oezzaou
#  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2025/08/11 09:47:00 by oezzaou
#  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
#  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
#  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
#  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

# INFO:====<[ autostart: script ]>=============================================
#!/bin/bash

# NOTE:> Wallpapers relative path
wallpapers=~/dotfiles/hypr/.config/backgrounds

# NOTE:> Set a random wallpaper
random_image=$(find $wallpapers -type f | shuf -n 1)

# NOTE:> Get wallpaper colors or pallete
# rm -rf ~/.cache/wal && wal -i $random_image
wal -i $random_image

# NOTE:> Set new random image in the background
swww img $random_image # --transition-duration 1

# NOTE:> Update kitty colors based on wallpaper colors
source ~/.config/kitty/kitty.conf

# NOTE:> Update neovim color based on wallpaper colors
# Edit this config so it can send it to all nvim instances 
nvim --server /tmp/nvim_* --remote-send ':silent! colorscheme pywal<CR>:redraw!<CR>'
# if [ -e /tmp/nvim_* ]; then
#   nvim --server /tmp/nvim_* --remote-send ":colorscheme pywal<CR>"
# fi

# INFO:========================================================================
