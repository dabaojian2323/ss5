#! /bin/bash
# author:biu
read -p "请输入ss5账户: " username
read -p "请输入ss5密码: " passwd
echo "$username   $passwd"  > /etc/opt/ss5/ss5.passwd
systemctl restart ss5
echo "服务开启成功！账号 $username  密码 $passwd"
