#  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀               𓐓 hypr_init.sh 𓐔         
#  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
#  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀  Engineer: oezzaou <oussama.ezzaou@gmail.com>
#  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
#  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
#  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2026/11/26 16:28:30 by oezzaou
#  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2026/11/26 16:28:38 by oezzaou
#  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
#  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
#  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
#  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

#!/usr/bin/env bash
set -Eeuo pipefail

default_wal="${HOME}/dotfiles/hypr/.config/backgrounds/1337.png"

for command_name in wal awww awww-daemon pgrep; do
	if ! command -v "$command_name" >/dev/null 2>&1; then
		printf 'hypr_init: required command not found: %s\n' "$command_name" >&2
		exit 127
	fi
done

if [[ ! -r "$default_wal" ]]; then
	printf 'hypr_init: wallpaper is missing or unreadable: %s\n' "$default_wal" >&2
	exit 1
fi

# Start awww's daemon once, without matching this script's own command line.
if pgrep -x awww-daemon >/dev/null 2>&1; then
	printf 'hypr_init: awww-daemon is already running.\n'
else
	printf 'hypr_init: starting awww-daemon.\n'
	awww-daemon >/dev/null 2>&1 &

	# Give the daemon time to create its socket before sending it a request.
	for ((attempt = 0; attempt < 30; attempt++)); do
		if pgrep -x awww-daemon >/dev/null 2>&1; then
			break
		fi
		sleep 0.1
	done

	if ! pgrep -x awww-daemon >/dev/null 2>&1; then
		printf 'hypr_init: awww-daemon failed to start.\n' >&2
		exit 1
	fi
fi

# Generate the color scheme, then retry the wallpaper request until awww's
# daemon socket is ready. The daemon process can exist before it accepts IPC.
wal -i "$default_wal"

for ((attempt = 0; attempt < 50; attempt++)); do
	if awww img "$default_wal"; then
		exit 0
	fi
	sleep 0.05
done

printf 'hypr_init: awww-daemon did not accept the wallpaper after 10 seconds.\n' >&2
exit 1
