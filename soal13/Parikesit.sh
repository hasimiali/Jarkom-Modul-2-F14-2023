#!/bin/bash
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/parikesit.abimanyu.f14.conf

wget -O '/var/www/parikesit.abimanyu.f14.com.zip' 'https://drive.usercontent.google.com/download?id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS'
unzip /var/www/parikesit.abimanyu.f14.com.zip -d /var/www/
rm -r /var/www/parikesit.abimanyu.f14
mv /var/www/parikesit.abimanyu.yyy.com /var/www/parikesit.abimanyu.f14
rm /var/www/parikesit.abimanyu.f14.com.zip
mkdir /var/www/parikesit.abimanyu.f14/secret
mkdir /var/www/parikesit.abimanyu.f14/secret/html
echo ‘<h1>Rahasia</h1>’ > /var/www/parikesit.abimanyu.f14/secret/html/index.html

conf="<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port that
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/parikesit.abimanyu.f14
	ServerName parikesit.abimanyu.f14.com
	ServerAlias www.parikesit.abimanyu.f14.com

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with \"a2disconf\".
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet"

echo "$conf" > /etc/apache2/sites-available/parikesit.abimanyu.f14.conf

a2ensite parikesit.abimanyu.f14.conf
service apache2 restart