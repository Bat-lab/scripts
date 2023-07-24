
echo "give H:M"

read -p "time to schedule:" hr

echo $(date -d "$hr 90  minutes ago" +'%H %M') "* * * cat -n commands"





echo  $(( 2 + 2 )) 
