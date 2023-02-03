#!/bin/sh

systemctl stop tomcat-emp

sleep 30

pid=$(ps -ef | grep -i /data/tomcat-app/tomcat-emp | grep -v 'grep' | sed -n 1p |awk '{print $2}')

if [[ -n "$pid" ]]
then
        echo "tomcat-emp is running systemctl doesn't stop so killing tomcat process"
        kill -9 $pid
        > /data/tomcat-app/tomcat-emp/logs/catalina.out
        echo "tomcat-emp is starting now"
        systemctl start tomcat-emp

       timestamp="$(date +'%b-%d-%y')"
       find /data/code-backup/ -type f -ctime +1 -exec rm -rf {} \;
       tar -cvpzf /data/code-backup/all-tomcat-${timestamp}.tar.gz /data/tomcat-app

else
        echo "systemctl stopped the tomcat-emp so starting the tomcat-emp"
        > /data/tomcat-app/tomcat-emp/logs/catalina.out

        systemctl start tomcat-emp

       timestamp="$(date +'%b-%d-%y')"
       find /data/code-backup/ -type f -ctime +1 -exec rm -rf {} \;
       tar -cvpzf /data/code-backup/all-tomcat-${timestamp}.tar.gz /data/tomcat-app

fi


