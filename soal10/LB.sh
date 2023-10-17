#!/bin/bash
conf=" # Default menggunakan Round Robin
upstream myweb  {
        server 192.228.3.2:8002; #IP AbimanyuWebServer
        server 192.228.3.3:8001; #IP PrabukusumaWebServer
        server 192.228.3.4:8003; #IP WisanggeniWebServer
}

server {
        listen 80;
        server_name arjuna.f14.com;

        location / {
        proxy_pass http://myweb;
        }
}"

echo "$conf" > /etc/nginx/sites-available/lb-arjuna

ln -s /etc/nginx/sites-available/lb-arjuna /etc/nginx/sites-enabled

service nginx restart