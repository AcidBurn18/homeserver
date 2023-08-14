version: '3'
services:
  audiobookshelf:
    image: ghcr.io/advplyr/audiobookshelf
    container_name: audiobookshelf
    ports:
      - "13378:80"
    restart: unless-stopped
    volumes:
      - /mnt/raid1/audibookshelf/config:/config
      - /mnt/raid1/audibookshelf/metadata:/metadata
      - /mnt/raid1/audibookshelf/audiobooks:/audiobooks
      - /mnt/raid1/audibookshelf/podcasts:/podcasts
