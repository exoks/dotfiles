# Dotfiles #
This repository contains my personal configuration files for **Arch Linux**, including **Neovim**, **Kitty**, **Hyprland**, **Tmux** and other essential tools.

### **Features** ###
- **Neovim**: Custom configuration with plugins and keybindings.
- **Kitty**: Personalized terminal settings for better performance and aesthetics.
- **Hyprland**: Tiling window manager setup with keybindings and workflow enhancements.
- **Tmux**: Session management and seamless navigation.
- **Zsh**: Customized shell setup with aliases and plugins.
- **Rofi**: Application launcher configuration.
- **Waybar**: status bar setup for Wayland.
- **Wofi**: Alternative application launcher.
- **Neofetch**: System information display customization. 
- **Scripts**: Collection of custom scripts for automation and workflow improvements.

### **Structure** ###
~/.dotfiles/  
├── nvim/ --------- # Neovim configuration  
├── kitty/ --------- # Kitty terminal configuration  
├── hypr/ --------- # Hyprland configuration  
├── tmux/ -------- # Tmux configuration  
├── zsh/ ---------- # Zsh configuration  
├── rofi/ ---------- # Rofi configuration  
├── waybar/ ----- # Waybar configuration  
├── wofi/ -------- # Wofi configuration  
├── neofetch/ --- # Neofetch configuration  
├── scripts/ ----- # Custom scripts  

### **Usage** ###
```bash
git clone https://github.com/exoks/dotfiles.git
cd ~/.dotfiles
```

To apply a specific configuration, you can use [`GNUStow`](https://www.gnu.org/software/stow/) symlink file manager:
- Examples:
    ```bash
    stow nvim
    ```
    ```bash
    stow kitty
    ```
    ```bash
    stow hypr
    ```

### **Contributions** ###
This repository is primarily for personal use, but feel free to explore, fork, or suggest improvements.
