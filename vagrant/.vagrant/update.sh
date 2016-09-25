#!/bin/bash
echo "Update System."
yum -y upgrade

wget http://repos.1c-bitrix.ru/yum/bitrix-env.sh
chmod +x bitrix-env.sh
sh ./bitrix-env.sh

sed -i 's/~\/menu.sh/#~\/menu.sh/' /root/.bash_profile

echo "bitrix-env.sh"  
rm -f /etc/php.d/*xdebug.ini*

echo 'zend_extension = xdebug.so
xdebug.remote_enable = On
xdebug.remote_connect_back = On' >> /etc/php.d/15-xdebug.ini.disabled

mv -f /etc/php.d/15-xdebug.ini.disabled /etc/php.d/15-xdebug.ini

echo -e "\e[1;32mRestarting apache service\e[0m"
service httpd restart

mkdir -p /tmp/php_sessions/www
mkdir -p /tmp/php_upload/www
wget --quiet --directory-prefix=/home/bitrix/www http://www.1c-bitrix.ru/download/scripts/bitrixsetup.php

chown -R bitrix:bitrix /home/bitrix
chown -R bitrix:bitrix /tmp/php_sessions
chown -R bitrix:bitrix /tmp/php_upload

echo '
EnableSendfile Off
' >> /etc/httpd/bx/custom/z_bx_custom.conf 

echo '
sendfile off;
' >> /etc/nginx/bx/conf/bitrix_general.conf

sed 's/sendmail_path = msmtp -t -i/; sendmail_path = msmtp -t -i/g' /etc/php.d/bitrixenv.ini
echo '
sendmail_path = sendmail -t -i -f info@legacystudio.ru
' >> /etc/php.d/bitrixenv.ini

echo -e "\e[1;32mRestarting apache service\e[0m"
service httpd restart

yum install -y gcc make kernel-devel
#/etc/init.d/vboxadd setup
sh /opt/VBox*/init/vboxadd setup