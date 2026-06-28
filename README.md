# Setup
## Start
1. For all `*.example` file, create a real counterpart and fill in values.
2. Run `scripts/init.sh`.
3. Run `sudo loginctl enable-linger $USER` to prevent service accidentally exiting.
## Rclone
1. Run `docker compose logs qbittorrent | grep password` to get initial password
## QBit
1. Go to qbit's webUI, log-in.
2. Change password.
3. Connection -> Connection Limits
4. BitTorrent -> Seeding Limits
5. Downloads -> Pre-allocate
6. Speed -> Global Upload Speed Limit
7. BitTorrent -> Close DHT related switches
8. Change Port
## MP
1. Downloader
2. Menu
3. Media Server
4. Site
5. CookieCloud