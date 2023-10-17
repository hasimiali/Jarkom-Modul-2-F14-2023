#!/bin/bash
zone="zone \"arjuna.f14.com\" {
	type master;
	file \"/etc/bind/jarkom/arjuna.f14.com\";
};

zone \"abimanyu.f14.com\" {
	type master;
	file \"/etc/bind/jarkom/abimanyu.f14.com\";
};"

echo "$zone" > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.f14.com

config=';
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
@		IN	A		192.228.3.5		; IP LB-ARJUNA
www		IN	CNAME	abimanyu.f14.com.
@		IN	AAAA		::1'

echo "$config" > /etc/bind/jarkom/abimanyu.f14.com

service bind9 restart