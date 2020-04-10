#/bin/bash

mkdir /var/www/html/$1

cd /etc/apache2/sites-available
touch $1.conf

cat <<EOT >> $1.conf
<VirtualHost *:80>
DocumentRoot /var/www/html/$1
ServerName $1.com
ServerAlias www.$1.com
</VirtualHost>
EOT

a2ensite $1.conf
sudo service apache2 restart

sudo certbot --apache -d $1.com -d www.$1.com
