# Netbox Backup Script

This repository contains a script to back up the Netbox PostgreSQL database and media files. The script performs the following tasks:
1. Backs up the Netbox PostgreSQL database.
2. Archives the Netbox media files.
3. Deletes backups older than 7 days, except for the first of the month backups.

## Prerequisites

- Ensure you have `pg_dump` installed.
- Ensure you have the necessary permissions to create directories and files in `/opt/backups/netbox`.
- Ensure the `PGPASSWORD` environment variable is set with the PostgreSQL password.

## Setup

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```sh
   git clone https://github.com/yourusername/netbox-backup-script.git
   cd netbox-backup-script
    ```