#! /bin/bash
#author:biu
con1="auth 0.0.0.0/0 -  u"
con2="permit  u  0.0.0.0/0  -   0.0.0.0/0   -    -   -  -   -"
yum -y install pam-devel openldap-devel openssl-devel &>  /dev/null
tar -zxvf ss5-3.8.9-8.tar.gz   &> /dev/null
cd ss5-3.8.9     &> /dev/null
yum -y install gcc  &> /dev/null
./configure  &> /dev/null
make && make install &> /dev/null
echo "install success and config now"
sed -i "87c$con1"  /etc/opt/ss5/ss5.conf
sed -i "203c$con2" /etc/opt/ss5/ss5.conf
read -p "请输入ss5账户: " username
read -p "请输入ss5密码: " passwd
echo "$username   $passwd"  >  /etc/opt/ss5/ss5.passwd
chmod 755 /etc/rc.d/init.d/ss5  &> /dev/null
/etc/rc.d/init.d/ss5 restart     &> /dev/null
echo "服务开启成功！账号 $username  密码 $passwd"
