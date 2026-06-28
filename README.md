# Setup
## Start
1. For all `*.example` file, create a real counterpart and fill in values.
2. Run `scripts/init.sh`.
## RClone
1. Run `rclone/install.sh` to run RClone service.
3. Run `sudo loginctl enable-linger $USER` to prevent service accidentally exiting.
## QBit
1. Run `docker compose logs qbittorrent | grep password` to get initial password
2. Go to qbit's webUI, log-in.
3. Change password.
4. Change Port
5. Connection -> Connection Limits
6. BitTorrent -> Seeding Limits
7. Downloads -> Pre-allocate
8. Speed -> Global Upload Speed Limit
9. BitTorrent -> Close DHT related switches
## MP
1. Downloader
2. Menu
3. Media Server
4. Site
5. CookieCloud