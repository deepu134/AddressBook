#!/bin/bash -x
echo "Address Book"
declare -A add
echo "MAX 10 SLOTS"
for ((i=0;i<10;i++))do
add[$i,0]=" "
done
function Address(){
        read -p "Enter First name:" Fname
        pat='^([A-Z]{1}+[A-Za-z]{2,})+$'
        if [[ $Fname =~ $pat ]]
        then
                add[$1,0]=$Fname
               
        else
                echo "Invalid:Minimum 2 Character Starts with  Uppercase"
        fi
         read -p "Enter Last name:" Lname
        pat='^([A-Z]{1}+[A-Za-z]{2,})+$'
        if [[ $Lname =~ $pat ]]
        then
                add[$1,1]=$Lname
        else
                echo "Invalid:Minimum 2 Character Starts with  Uppercase"
        fi
	while true
	do
         read -p "Enter mob number:" Mnum
        pat='^(([[0-9]{2})+[ ]([0-9]{10})+)$'
        if [[ $Mnum =~ $pat ]]
        then
                add[$1,2]=$Mnum
		break
        else
                echo "Invalid:Add Country code followed by your mobile number"
        fi
	done
        read -p "Enter City:" city
         pat='^[A-Za-z]{2,}+$'
        if [[ $city =~ $pat ]]
        then
                add[$1,3]=$city
        else
                echo "Invalid:Minimun 2 Character"
        fi
         read -p "Enter State:" state
         pat='^[A-Za-z]{2,}+$'
        if [[ $state =~ $pat ]]
        then
                add[$1,4]=$state
        else
                echo "Invalid:Minimun 2 Character"
        fi
        read -p "Enter pin:" pin
         pat='^[0-9]{6}+$'
        if [[ $pin =~ $pat ]]
        then
                add[$1,5]=$pin
        else
                echo "Invalid: 6 number required"
        fi
}
Address 0
function display()
{
k=1
for ((j=0;j<=5;j++)) do
        echo "Slot:$k"
        ((k++))
        for ((i=0;i<=6;i++)) do
                echo  ${add[$j,$i]}
        done
done

}
display
