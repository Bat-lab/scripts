#!/bin/bash

echo "[install]" > /opt/install/hosts

read -p "number of ips:" j

#for (( i = $j ; i >= 1 ; i-- ))
for (( i = 1 ; i <= $j ; i++ ))

do

read -p "what is ip:" ip
if [[ $ip =~ [0-9] ]];

then

read -p "user:" user
read -p "password:" pass
echo "$ip ansible_user=$user ansible_ssh_pass=$pass ansible_sudo_pass=$pass" >> /opt/install/hosts 

ansible-playbook -i /opt/install/hosts basic-pkg-install.yaml 

else

echo "not valid ip"

echo "installation done"
#ansible-playbook -i /opt/install/hosts basic-pkg-install.yaml 

fi

done




