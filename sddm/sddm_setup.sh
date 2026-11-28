#  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀              𓐓 sddm_setup.sh 𓐔         
#  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
#  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀  Engineer: oezzaou <oussama.ezzaou@gmail.com>
#  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
#  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
#  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2026/11/28 16:21:27 by oezzaou
#  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2026/11/28 16:28:43 by oezzaou
#  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
#  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
#  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
#  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

#!/usr/bin/env bash

# INFO: ===[ SDDM setup guide ]================================================
# INFO: 2. Install SDDM with your distribution's package manager. This script
#          targets Arch Linux.
# INFO: 3. The system-wide SDDM configuration file is /etc/sddm.conf.
# INFO: 4. To view SDDM's example configuration, run: sddm --example-config
# INFO: 5. To write that example to the system config, run:
#          sudo sddm --example-config | sudo tee /etc/sddm.conf
# INFO: 6. This script installs the Silent SDDM theme from the AUR
#          using yay or paru.
# INFO:    Silent SDDM theme project: https://github.com/uiriansan/SilentSDDM
# INFO: 8. The theme configuration is selected in:
#          `/usr/share/sddm/themes/silent/metadata.desktop`
# INFO: 9. This script sets `ConfigFile=configs/ken.conf` in that metadata file
# INFO: 10. This script copies the backgrounds in this package's `backgrounds`
#          directory into `/usr/share/sddm/themes/silent/backgrounds`,
#          replacing files with matching names.
# INFO: 11. Enable SDDM at boot with: sudo systemctl enable sddm

# Stop if a command fails, an unset variable is used, or a pipeline fails.
set -Eeuo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
readonly SDDM_PACKAGE="sddm"
readonly SILENT_THEME_PACKAGE="sddm-silent-theme"
readonly SDDM_CONFIG="/etc/sddm.conf"
readonly THEME_DIR="/usr/share/sddm/themes/silent"
readonly THEME_METADATA="$THEME_DIR/metadata.desktop"

die() {
  printf 'sddm_setup: %s\n' "$*" >&2
  exit 1
}

# This setup script targets Arch Linux and uses GNU Stow like the other packages.
for command in pacman sudo stow; do
  command -v "$command" >/dev/null 2>&1 || die "required command not found: $command"
done

# switcher.sh uses ffmpeg to generate the Silent theme's video preview.
command -v ffmpeg >/dev/null 2>&1 || die "required command not found: ffmpeg (needed by switcher.sh)"

# The Silent SDDM theme is installed from the AUR, so require an AUR helper.
if command -v yay >/dev/null 2>&1; then
  readonly AUR_HELPER="yay"
elif command -v paru >/dev/null 2>&1; then
  readonly AUR_HELPER="paru"
else
  die "install yay or paru first; the Silent SDDM theme is an AUR package"
fi

# Install SDDM from the official repositories if it is not already installed.
if ! pacman -Qi "$SDDM_PACKAGE" >/dev/null 2>&1; then
  printf 'sddm_setup: installing %s...\n' "$SDDM_PACKAGE"
  sudo pacman -S --needed -- "$SDDM_PACKAGE"
else
  printf 'sddm_setup: %s is already installed.\n' "$SDDM_PACKAGE"
fi

# Install the Silent theme using the available AUR helper when needed.
if ! pacman -Qi "$SILENT_THEME_PACKAGE" >/dev/null 2>&1; then
  printf 'sddm_setup: installing %s with %s...\n' "$SILENT_THEME_PACKAGE" "$AUR_HELPER"
  "$AUR_HELPER" -S --needed -- "$SILENT_THEME_PACKAGE"
else
  printf 'sddm_setup: %s is already installed.\n' "$SILENT_THEME_PACKAGE"
fi

# Link this package's sddm.conf to /etc/sddm.conf with GNU Stow.
# Run Stow with sudo because /etc is owned by the system administrator.
printf 'sddm_setup: linking %s into /etc with GNU Stow...\n' "$SDDM_CONFIG"
sudo stow --dir="$SCRIPT_DIR" --target=/etc --ignore='.*\.sh$' .

# Point the Silent theme at ken.conf, as described in sddm.conf's setup notes.
# Save a copy first so the original theme metadata can be restored if needed.
[[ -f "$THEME_METADATA" ]] || die "theme metadata not found: $THEME_METADATA"
# Keep a backup before changing the theme's own configuration.
if ! grep -Eq '^[[:space:]]*ConfigFile[[:space:]]*=[[:space:]]*configs/ken\.conf[[:space:]]*$' "$THEME_METADATA"; then
  sudo cp -n -- "$THEME_METADATA" "$THEME_METADATA.codex-backup"
  if grep -Eq '^[[:space:]]*#?[[:space:]]*ConfigFile[[:space:]]*=' "$THEME_METADATA"; then
    # Comment any existing active setting, then enable the requested config.
    sudo sed -i -E \
      -e '/^[[:space:]]*ConfigFile[[:space:]]*=/s|^|#|' \
      -e 's|^[[:space:]]*#[[:space:]]*ConfigFile[[:space:]]*=.*$|ConfigFile=configs/ken.conf|' \
      "$THEME_METADATA"
  else
    # Add the setting when this version of the theme has no ConfigFile entry.
    printf '\nConfigFile=configs/ken.conf\n' | sudo tee -a "$THEME_METADATA" >/dev/null
  fi
  if ! grep -q '^ConfigFile=configs/ken\.conf$' "$THEME_METADATA"; then
    die "could not set ConfigFile in $THEME_METADATA; edit it to use configs/ken.conf"
  fi
fi

# Install this package's background assets into the Silent theme. Matching
# filenames are replaced; other backgrounds shipped with the theme are kept.
readonly SOURCE_BACKGROUNDS="$SCRIPT_DIR/backgrounds"
readonly TARGET_BACKGROUNDS="$THEME_DIR/backgrounds"
[[ -d "$SOURCE_BACKGROUNDS" ]] || die "background directory not found: $SOURCE_BACKGROUNDS"
sudo install -d -- "$TARGET_BACKGROUNDS"
while IFS= read -r -d '' background; do
  sudo install -m 0644 -- "$background" "$TARGET_BACKGROUNDS/$(basename -- "$background")"
done < <(find "$SOURCE_BACKGROUNDS" -maxdepth 1 -type f -print0)

# Use the switcher to initialize the selected video and its preview. Keep ken.mp4
# as the setup default; users can run switcher.sh with another video afterward.
[[ -f "$SOURCE_BACKGROUNDS/ken.mp4" ]] || die "default background not found: $SOURCE_BACKGROUNDS/ken.mp4"
printf 'sddm_setup: selecting the default background with switcher.sh...\n'
"$SCRIPT_DIR/switcher.sh" "$SOURCE_BACKGROUNDS/ken.mp4"

printf '\nInstalled package backgrounds into:\n  %s\n' "$TARGET_BACKGROUNDS"
printf 'Then enable SDDM for your next boot with: sudo systemctl enable sddm\n'
