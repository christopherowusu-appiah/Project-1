#!/bin/bash

#useful loops activity
path_list=('/etc/passwd' '/etc/shadow')

 for x in ${path_list[@]}

do ls -l $x

done

#bonus one
users=$(ls /home)

for user in ${users[@]}
 do

sudo -lu $user

done


