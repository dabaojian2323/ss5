#!/bin/bash 
# author:biu ss5 install
if [ ! -d /var/run/ss5 ];
then 
 mkdir /var/run/ss5
fi
systemctl restart ss5
systemctl status ss5
echo "开启成功"