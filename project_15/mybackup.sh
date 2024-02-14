#! /bin/bash

# Perform the backup of all databases using the mysqldump
# Store the output in the file all-databases-backup.sql
mysqldump --all-databases --host=127.0.0.1 --port=3306 --user=root --password > all-databases-backup.sql

# In the /tmp directory, create a directory named after current date like YYYYMMDD.
current_date=$(date +%Y%m%d)
mkdir -p "/tmp/mysqldumps/$current_date"

# Move the file all-databases-backup.sql to /tmp/mysqldumps/<current date>/
mv all-databases-backup.sql "/tmp/mysqldumps/$current_date"