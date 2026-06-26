#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

if [ ! -f "rclone.conf" ]; then
    echo "================================================================="
    echo " 🚨 Warning: rclone.conf does not exist!"
    echo " Please run 'rclone config' first to create your configuration."
    echo " "
    echo " ⚠️ IMPORTANT: When setting up the new remote, you MUST name"
    echo " it 'gdrive' so it matches the systemd service configuration!"
    echo "================================================================="
    exit 1
fi

echo "Installing rclone config..."

mkdir -p ~/.config/rclone
cp -f rclone.conf ~/.config/rclone/rclone.conf

echo "Creating cache directory..."

mkdir -p ~/.cache/rclone

echo "Creating mount point..."

sudo mkdir -p /mnt/gdrive

echo "Installing user service..."

mkdir -p ~/.config/systemd/user
cp -f rclone.service ~/.config/systemd/user/

systemctl --user daemon-reload
systemctl --user enable rclone
systemctl --user restart rclone

echo
systemctl --user status rclone --no-pager