#!/bin/bash

# Remote server details
host="a0dfc11ba139.a982e858.alu-cod.online"
username="a0dfc11ba139"
password="899c79fc532cd0591af1"
remote_directory="/home/sftp-student/03033/summative"

# Directory name for backup
directory_name="0323-RW-SOFEN-8120120-13-q1"

# Create the backup script
backup_script="backup-$directory_name.sh"
echo "#!/bin/bash" > "$backup_script"
echo "rsync -avz -e 'sshpass -p $password ssh -o StrictHostKeyChecking=no' \"$directory_name\" $username@$host:\"$remote_directory\"" >> "$backup_script"

echo "Backup script created: $backup_script"
