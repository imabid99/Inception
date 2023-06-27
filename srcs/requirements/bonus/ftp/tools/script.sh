#!/bin/bash

service vsftpd start

adduser $myftp_user --disabled-password

echo "$myftp_user:$myftp_pwd" | chpasswd

echo "$myftp_user" >> /etc/vsftpd.userlist

mkdir -p /home/$myftp_user/ftp
# chmod a-w /home/$myftp_user/ftp

mkdir -p /home/$myftp_user/ftp/files
chown -R $myftp_user:$myftp_user /home/$myftp_user/ftp
chmod -R 755 /home/$myftp_user/ftp

sed -i "s/#write_enable=YES/write_enable=YES/"   /etc/vsftpd.conf
sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/"   /etc/vsftpd.conf

echo "
local_enable=YES
allow_writeable_chroot=YES
pasv_enable=YES
local_root=/home/$myftp_user/ftp
pasv_min_port=40000
pasv_max_port=40005
userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd