#!/bin/bash
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

	<Directory /var/www/parikesit.abimanyu.f14/public>
		Options +Indexes
 	</Directory>

	<Directory /var/www/parikesit.abimanyu.f14/secret>
		Options -Indexes
 	</Directory>

	<Directory /var/www/parikesit.abimanyu.f14>
		Options +FollowSymLinks -Multiviews
		AllowOverride All
	</Directory>

	Alias \"/js\" \"/var/www/parikesit.abimanyu.f14/public/js\"

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined

	ErrorDocument 403 /error/403.html
	ErrorDocument 404 /error/404.html

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with \"a2disconf\".
        #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet"

echo "$conf" > /etc/apache2/sites-available/parikesit.abimanyu.f14.conf

ht='RewriteEngine On

RewriteCond %{REQUEST_URI} abimanyu [NC]
RewriteCond %{REQUEST_URI} \.(jpg|jpeg|png|gif)$ [NC]
RewriteCond %{REQUEST_URI} !/public/images/abimanyu.png

RewriteRule ^(.*)$ /public/images/abimanyu.png [R=301,L]'

echo "$ht" > /var/www/parikesit.abimanyu.f14/.htaccess

a2enmod rewrite
service apache2 restart