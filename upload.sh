#!/bin/bash
server=
user=
password=
batcher="/dir/to/Mikrotik-Blacklist/instructions.ba"

expect -c "
spawn sftp -o "BatchMode=no" -b "$batcher" "$user@$server" 
expect -nocase \"*password:\" { send \"$password\r\"; interact }
