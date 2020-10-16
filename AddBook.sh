#!/bin/bash -x
echo "Address Book"
declare -A add
echo "MAX 10 SLOTS"
for ((i=0;i<10;i++))do
add[$i,0]=" "
done
function Address(){

        read -p "Enter First name:" Fname
        add[$1,0]=$Fname
         read -p "Enter Last name:" Lname
        add[$1,1]=$Lname
         read -p "Enter mob number:" Mnum
        add[$1,2]=$Mnum
        read -p "Enter City:" city
        add[$1,3]=$city
         read -p "Enter State:" state
        add[$1,4]=$state
         read -p "Enter pin:" pin
        add[$1,5]=$pin
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
        echo "next"
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
        1)read -p "ReEnter Fname:" edit
        add[$pos,0]=$edit;;
        2)read -p "ReEnter Lname:" edit
        add[$pos,1]=$edit;;
        3)read -p "ReEnter Mobile number:" edit
        add[$pos,2]=$edit;;
        4)read -p "ReEnter city:" edit
        add[$pos,3]=$edit;;
        5)read -p "ReEnter state:" edit
        add[$pos,4]=$edit;;
        6)read -p "ReEnter pin:" edit
        add[$pos,5]=$edit;;
        *);;
esac
}



function delete()
{
read -p "Enter Slot Number to Delete" pos
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
echo "Slot:$k"
        ((k++))
    for ((i=0;i<=6;i++)) do
        echo  ${add[$j,$i]}
    done
done

}

while [ true ]
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


