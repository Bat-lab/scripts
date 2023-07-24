
numberofline=$(cat -n ~/new-file.txt | grep -i SCRIPTS_HOME | awk '{print $1}' | wc -l)

for (( i = 0 ; i <= $numberofline ; i++ ))

do

echo numberofline $i

arr=($(cat -n ~/new-file.txt | grep -i SCRIPTS_HOME | awk '{print $1}' | tail -n 1))


for j in "${arr[@]}"

do 

echo $j is line number
sed -i  "$j"d ~/new-file.txt

done

done

