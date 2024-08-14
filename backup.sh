#!/bin/bash

# Ensure the PGPASSWORD environment variable is set
if [ -z "$PGPASSWORD" ]; then
  echo "Error: PGPASSWORD environment variable is not set."
  exit 1
fi

# Define the backup directory
BACKUP_DIR="/opt/backups/netbox"
mkdir -p "$BACKUP_DIR"

# DB Backup and gzip
/usr/bin/pg_dump postgres://netbox:$PGPASSWORD@127.0.0.1:5432/netbox | gzip > "$BACKUP_DIR/netbox_$(date +%Y-%m-%d).psql.gz"

# Change to the root directory and create the tar archive using relative paths
tar -czf "$BACKUP_DIR/netbox_media_$(date +%Y-%m-%d).tar.gz" -C / opt/netbox/netbox/media/

# Delete backups older than 7 days but not first of month backups
find "$BACKUP_DIR" ! -name '*01.psql.gz' ! -name 'backup.sh' -mmin +$((7*60*24)) -exec rm -f {} \;