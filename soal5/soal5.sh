#!/bin/bash
zone="zone \"arjuna.f14.com\" {
	type master;
	file \"/etc/bind/jarkom/arjuna.f14.com\";
};

zone \"abimanyu.f14.com\" {
	type master;
	file \"/etc/bind/jarkom/abimanyu.f14.com\";
};

zone \"3.228.192.in-addr.arpa\" {
    type master;
    file \"/etc/bind/jarkom/3.228.192.in-addr.arpa\";
};"

echo "$zone" > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.f14.com

conf=';
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
@		IN	NS		abimanyu.f14.com.
@		IN	A		192.228.3.2		; IP Abimanyu
www		IN	CNAME	abimanyu.f14.com.
parikesit	IN	A		192.228.3.2		; IP Abimanyu'

echo "$conf" > /etc/bind/jarkom/abimanyu.f14.com

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
2				IN	PTR	abimanyu.f14.com.	; Byte ke-4 Abimanyu'

echo "$revConf" > /etc/bind/jarkom/3.228.192.in-addr.arpa

service bind9 restart