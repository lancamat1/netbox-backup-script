# Netbox Backup Script

This repository contains a script to back up the Netbox PostgreSQL database and media files. The script performs the following tasks:

1. Backs up the Netbox PostgreSQL database.
2. Archives the Netbox media files.
3. Deletes backups older than 7 days, except for the first of the month backups.

## Prerequisites

- Ensure you have `pg_dump` installed.
- Ensure you have the necessary permissions to create directories and files in `/opt/backups/netbox`.
- Ensure the `PGPASSWORD` environment variable is set with the PostgreSQL password.
- (optional) Install cron to automate the backup process.

## Setup

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```sh
   git clone git@github.com:lancamat1/netbox-backup-script.git
   cd netbox-backup-script
   ```

2. **Make the Script Executable**

   Run the following command to make the script executable:

   ```sh
   chmod +x backup_script.sh
   ```

3. **Run the Backup Script**

   Set the `PGPASSWORD` environment variable and run the script:

   ```sh
   PGPASSWORD=your_postgres_password ./backup_script.sh
   ```

4. **Verify the Backups**

   Check the `/opt/backups/netbox` directory to ensure the backups are created.

## Automate the Backup

To automate the backup process, you can add a cron job. For example, to run the backup script every day at 2 AM:

1. Open the crontab editor:

   ```sh
   crontab -e
   ```

2. Add the following line to schedule the backup:

   ```sh
   0 2 * * * PGPASSWORD=your_postgres_password /path/to/your/repository/backup_script.sh
   ```

   Replace `your_postgres_password` with the actual PostgreSQL password and `/path/to/your/repository` with the path to the cloned repository.