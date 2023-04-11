#!/bin/bash

apt update

apt install expect -y

useradd -m -d /home/apmosys -s /bin/bash apmosys

password=$(expect -c "
set timeout 10
spawn passwd apmosys
expect \"New password:\"
send -- \"Welcome@2021\r\"
expect \"Retype new password:\"
send -- \"Welcome@2021\r\"
expect eof
")
echo "$password"

      wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

      dpkg -i ./google-chrome-stable_current_amd64.deb

      wget https://download.anydesk.com/linux/anydesk_6.2.1-1_amd64.deb

      dpkg -i ./anydesk_6.2.1-1_amd64.deb
      apt --fix-broken install -y

      apt install openjdk-8-jdk -y
