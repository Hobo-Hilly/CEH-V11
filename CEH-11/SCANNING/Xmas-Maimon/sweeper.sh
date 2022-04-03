#!/bin/bash

read -p "Enter IP subnet ...  > " IP #Storing user input into var IP

for i in {1..254}
do 
	ping -c 1 $IP.$i | grep ^64 | awk '{print $4}' | cut -d ":" -f 1 &
done

# Note: this only for class C subnets with /24 on the end

