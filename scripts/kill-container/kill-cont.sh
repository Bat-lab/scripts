#!/bin/bash
docker ps -a > /root/script/docker-ps
cat -n /root/script/docker-ps

read -p 'Line num of Container:' ln

conf=$(sed -n "${ln}p" /root/script/docker-ps)
echo $conf
echo What is you intention
read -p 'Dl Container C | Dl Container with image B:' cont


if [ $cont == C ]
#b=$(awk 'NR== $a' docker-ps)
then
b=$(sed -n "${ln}p" /root/script/docker-ps | awk '{print $1}')
docker rm -f $b

elif [ $cont == B ]
then
b=$(sed -n "${ln}p" /root/script/docker-ps | awk '{print $1}')
c=$(sed -n "${ln}p" /root/script/docker-ps | awk '{print $2}')

docker rm -f $b
docker rmi $c

else

echo "fuck you"

fi
