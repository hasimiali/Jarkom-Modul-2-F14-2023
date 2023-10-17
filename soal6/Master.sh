#!/bin/bash
zone="zone \"arjuna.f14.com\" {
	type master;
    notify yes;
	also-notify { 192.228.1.2; };	// IP WerkudaraDNSSlave
    allow-transfer { 192.228.1.2; };	// IP WerkudaraDNSSlave
	file \"/etc/bind/jarkom/arjuna.f14.com\";
};

zone \"abimanyu.f14.com\" {
	type master;
    notify yes;
	also-notify { 192.228.1.2; };	// IP WerkudaraDNSSlave
    allow-transfer { 192.228.1.2; };	// IP WerkudaraDNSSlave
	file \"/etc/bind/jarkom/abimanyu.f14.com\";
};

zone \"3.228.192.in-addr.arpa\" {
    type master;
	notify yes;
	also-notify { 192.228.1.2; };	// IP WerkudaraDNSSlave
    allow-transfer { 192.228.1.2; };	// IP WerkudaraDNSSlave
    file \"/etc/bind/jarkom/3.228.192.in-addr.arpa\";
};"

echo "$zone" > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/3.228.192.in-addr.arpa

revConf=';
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	abimanyu.f14.com. root.abimanyu.f14.com. (
			2023101101		; Serial
			604800		; Refresh
			86400			; Retry
			2419200		; Expire
			604800 )		; Negative Cache TTL
;
3.228.192.in-addr.arpa.	IN	NS	abimanyu.f14.com.
3				IN	PTR	abimanyu.f14.com.	; Byte ke-4 AbimanyuWebServer'

echo "$revConf" > /etc/bind/jarkom/3.228.192.in-addr.arpa

service bind9 restart