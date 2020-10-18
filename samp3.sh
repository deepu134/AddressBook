#!/bin/bash -x
while true
do
read -p "Enter First Name:" Fname
pat="^[A-Z]{1}[a-z]{2,}$"
if [[ $Fname =~ $pat ]]
then
        echo "valid"
else
        echo "Invalid"
fi
done
