#!/usr/bin/env bash
set -euo pipefail

usage() {
    printf 'Usage: %s VIDEO_FILE\n' "${0##*/}" >&2
    printf 'Install VIDEO_FILE as the Silent SDDM theme background.\n' >&2
}

if [[ $# -ne 1 ]]; then
    usage
    exit 2
fi

input=$1
if [[ "$input" != /* ]]; then
    input="$(pwd)/$input"
fi
if [[ ! -f "$input" ]]; then
    printf 'Error: video file not found: %s\n' "$input" >&2
    exit 1
fi

target_dir="/usr/share/sddm/themes/silent/backgrounds"
frame_tmp=$(mktemp "${TMPDIR:-/tmp}/sddm-frame.XXXXXX.png")

cleanup() {
    rm -f -- "$frame_tmp"
}
trap cleanup EXIT

if ! ffmpeg -hide_banner -loglevel error -y -i "$input" -frames:v 1 "$frame_tmp"; then
    printf 'Error: could not extract a frame from: %s\n' "$input" >&2
    exit 1
fi

# Install only after extraction succeeds, leaving the source wallpaper untouched.
sudo install -d -- "$target_dir"
sudo install -m 0644 -- "$input" "$target_dir/ken.mp4"
sudo install -m 0644 -- "$frame_tmp" "$target_dir/ken.png"
printf 'SDDM video: %s/ken.mp4\nSDDM preview: %s/ken.png\n' "$target_dir" "$target_dir"
