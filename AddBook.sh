#!/bin/bash -x
echo "Address Book"
declare -A add
echo "MAX 10 SLOTS"
for ((i=0;i<10;i++))do
	add[$i,0]=" "
done
#Storing of data to a multidimentional array
function Address(){
	while true
	do
        	read -p "Enter First name:" Fname
		pat='^[A-Z]{1}[a-z]{2,}$'
		if [[ $Fname =~ $pat ]]
		then
        		add[$1,0]=$Fname
			break
		else
        		echo "Invalid:Minimum 2 character"
			echo -n "Re"
		fi
	done
	while true
	do
         	read -p "Enter Last name:" Lname
		pat='^[A-Z]{1}[a-z]{2,}$'
        	if [[ $Lname =~ $pat ]]
        	then
                	add[$1,1]=$Lname
			break
        	else
                	echo "Invalid:Minimum 2 Character Starts with  Uppercase"
		echo -n "Re"        
		fi
	done
	while true
	do
         	read -p "Enter mob number:" Mnum
		pat='^[0-9]{2}[ ]?[0-9]{10}$'
        	if [[ $Mnum =~ $pat ]]
        	then
                	add[$1,2]=$Mnum
			break
        	else
                	echo "Invalid:Add Country code followed by your mobile number"
			echo -n "Re"
        	fi
	done
	while true
	do
        	read -p "Enter City:" city
		pat='^[a-zA-Z]{3,10}$'
        	if [[ $city =~ $pat ]]
        	then
                	add[$1,3]=$city	
			break
        	else
                	echo "Invalid:Minimun 3 Character"
			echo -n "Re"
        	fi
	done
	while true
	do
         	read -p "Enter State:" state
	 	pat='^[a-zA-Z]{3,50}'
        	if [[ $state =~ $pat ]]
        	then
                	add[$1,4]=$state
			break
        	else
                	echo "Invalid:Minimun 3 Character"
			echo -n "Re"
        	fi
	done
	while true
	do
        	read -p "Enter pin:" pin
		 pat='^[0-9]{6}$'
        	if [[ $pin =~ $pat ]]
        	then
                	add[$1,5]=$pin
			break
        	else
                	echo "Invalid: 6 number required"
			echo -n "Re"
        	fi
	done
}


function insert()
{
	j=0
	stop=$1
	empty=" "
	for ((i=0;i<=10;i++))
	do
		if [[ " ${add[$i,0]} " =~ " $empty " ]]
		then
        		Address $i
        		((j++))
        		echo "-------------------------"
		else
        		continue
		fi
		if [ $j -eq $stop ]
		then
        		break
		fi
	done
}
#existing Address
add[0,0]=deepak
add[0,1]=kulal
add[0,2]=1234567894
add[0,3]=mangalore
add[0,4]=karnataka
add[0,5]=575023
add[1,0]=deeksha
add[1,1]=kulal
add[1,2]=8494844134
add[1,3]=surathkal
add[1,4]=karnataka
add[1,5]=575024

function edit()
{
	pos=$(($1-1))
	echo "1.First name 2.Last name 3.Mobile number 4.city 5.state 6.pin"
	read -p "Enter the fields to edit" field
	case $field in
	
        1)
	 while true
        do
                read -p "ReEnter Fname:" edit
                pat='^[A-Z]{1}[a-z]{2,}$'
                if [[ $edit =~ $pat ]]
                then
        	add[$pos,0]=$edit
	 	break
                else
                        echo "Invalid:Minimum 2 character"
                fi
		done
		;;
	
        2)while true
	do
		read -p "ReEnter Lname:" edit
	 	pat='^[A-Z]{1}[a-z]{2,}$'
                if [[ $edit =~ $pat ]]
                then
                        add[$pos,1]=$edit
                        break
                else
                        echo "Invalid:Minimum 2 Character"
                fi
	done
		;;
        3)while true
	do
		read -p "ReEnter Mobile number:" edit
         	pat='^[0-9]{2}[ ]?[0-9]{10}$'
                if [[ $edit =~ $pat ]]
                then
                        add[$pos,2]=$edit
                        break
                else
                        echo "Invalid:Add Country code followed by your mobile number"
                      
                fi
        done
		;;
        4)while true
	do
		read -p "ReEnter city:" edit
	 	pat='^[a-zA-Z]{3,10}'
                if [[ $edit =~ $pat ]]
                then
                        add[$pos,3]=$edit
                        break
                else
                        echo "Invalid:Minimun 3 Character"
                fi
        done
	;;
        5)while true
	do
		read -p "ReEnter state:" edit
	 	pat='^[a-zA-Z]{3,50}'
                if [[ $edit =~ $pat ]]
                then
                        add[$pos,4]=$edit
                        break
                else
                        echo "Invalid:Minimun 3 Character"
                fi
	done
		;;
        6)while true
	do
		read -p "ReEnter pin:" edit
		pat='^[0-9]{6}$'
                if [[ $edit =~ $pat ]]
                then
                        add[$pos,5]=$edit
                        break
                else
                        echo "Invalid: 6 number required"
                fi
        done
	;;
        *);;
esac
}



function delete()
{
	read -p "Enter Slot Number to Delete:" pos
	pos=$(($pos-1))
	echo "Deleted Address"
    	for ((i=0;i<6;i++)) do
        	echo  ${add[$pos,$i]}
    	done
	for ((i=0;i<6;i++));do add[$pos,$i]=' ';done
}

function display()
{
	k=1
	for ((j=0;j<=5;j++)) do
		echo "Address:$k"
        	((k++))
    	for ((i=0;i<=6;i++)) do
        	echo  ${add[$j,$i]}
    	done
	done

}

while true
do
	echo "1.Display Address Book 2.Edit 3.delete 4.Insert 5.Exit"
	read -p "Enter your option:" choice
	case $choice in
        	1)display;;
        	2)read -p "Enter the address nbr to edit:" p
        	edit $p;;
        	3)delete;;
        	4)read -p "How many Address will u add:" Anum
        	insert $Anum;;
        	5)break;;
        	*)echo "Invalid";;
	esac
done
