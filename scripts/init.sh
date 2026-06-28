#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

echo "================================================================="
echo "🚨 WARNING: This will completely WIPE your 'data' and 'downloads'!"
echo "All databases, system configs, and downloaded files will be DESTROYED."
echo "This action CANNOT be undone."
echo "================================================================="

# 防呆确认锁
read -p "Are you absolutely sure you want to nuke everything and start fresh? (y/N): " confirm

if [[ "$confirm" != [yY]* ]]; then
    echo "Operation aborted. Your data is safe!"
    exit 0
fi

echo "Nuking old data..."
sudo rm -rf data downloads

echo "Creating directory structure..."
mkdir -p \
  data/qbittorrent/config \
  data/moviepilot/config \
  data/moviepilot/cache \
  data/jellyfin/config \
  data/postgres \
  data/redis \
  data/caddy/data \
  data/caddy/config \
  downloads

echo "Setting ownership and permissions..."
sudo chown -R $USER:$USER data downloads
chmod -R 755 data downloads

echo
echo "Directory structure created successfully. You now have a clean slate!"

echo "================================================================="
echo "✅ All done! The environment is ready. You can now run 'docker compose up -d'."