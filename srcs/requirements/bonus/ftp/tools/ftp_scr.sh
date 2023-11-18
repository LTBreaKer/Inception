#!/bin/bash

useradd -m $FTP_USER -s /bin/bash; echo -n "$FTP_USER:$FTP_PASSWORD" | chpasswd && \
    echo "$FTP_USER" >> /etc/vsftpd.userlist


mkdir -p /var/run/vsftpd/empty

cd /home/$FTP_USER/ftp_directory/
chmod -R 777 ftp_data

cp /etc/vsftpd.conf /etc/vsftpd.conf.orig

cp /vsftpd.conf /etc/vsftpd.conf
echo "local_root=/home/$FTP_USER/ftp_directory/ftp_data" >> /etc/vsftpd.conf

vsftpd