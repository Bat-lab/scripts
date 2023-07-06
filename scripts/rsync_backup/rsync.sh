#!/bin/bash


find $(find /home/apmosys -type d -name "workspace") -type d -name "Logs" >  /opt/file.txt

sed -i 's+\ +\\ +g' /opt/file.txt

#find /home/apmosys -type d -name "workspace" > file.txt

#sed -i 's+ +\\ +g' file.txt
#sed -i 's+(+\\(+g' file.txt
#sed -i 's+)+\\)+g' file.txt

ips=$(hostname -I)

while IFS= read -r line
do


#du -sh "$line" > /tmp/fs-output.txt

#find "$line" -type f -mtime +7 -name '*' -execdir rm -rf  -- '{}' \;

#echo "$line"
#ls "$line"

rsync_logs=$(expect -c "

set timeout 2000000
spawn rsync -avzh -R $line root@192.168.7.22:/full-backup/jenkins/$ips


expect \"root@192.168.7.22's password:\"
send -- \"password\r\"

expect eof
")

echo "$rsync_logs"

done < /opt/file.txt



