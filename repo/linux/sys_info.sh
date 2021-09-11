#!/bin/bash

#check fi script was run as root. exit if true
#if [$UID -eq 0]
#then
#echo "please do not run this script as root"
#exit
#fi

#Define variables
output=$home/research/sys_info.txt
ip=$(ip addr |grep inet| tail -2 |head -1)
suids=$(sudo find / -type f -perm 777)

echo "A Quick Sytem Audit Script"
date
echo "Machine Type Info:"
echo $MACHTYPE
echo -e "Uname info: $(uname -a) \n"
echo -e "IP Info: $ip
echo "Hostname: $(hostname -s)"

echo "DNS Servers:"
cat /etc/resolv.conf

echo "Memory Info:"
free

echo -e "\nCPU INfo:"
iscpu | grep CPU

echo -e "\nDisk Usage:"
df -H | head -2

echo -e "\nWho is logged in: \n $(who -a) \n"

echo -e "\nExec Files:" >> ~/research/sys_info.txt
sudo find /home -type f -perm 777 >> ~/research/sys_info.txt

#Top 10 processes
echo -e "\nTop 10 Processes" >> ~/research/sys_info.txt
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11') | head >> ~/research/sys_info.txt


#if statement for research directory

#if [! -d $HOME/research]
#then
# mkdir $HOME/research
#fi

# if statement for specific file

#if [ -f $HOME/research/sys_info.txt]

#then
#	rm ~/research/sys_info.txt
#fi
