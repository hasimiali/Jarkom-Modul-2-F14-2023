#!/bin/bash
zone="zone \"arjuna.f14.com\" {
	type master;
	file \"/etc/bind/jarkom/arjuna.f14.com\";
};"

echo "$zone" > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom
cp /etc/bind/db.local /etc/bind/jarkom/arjuna.f14.com

config=';
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	arjuna.f14.com. root.arjuna.f14.com. (
			2022100601		; Serial
			604800		; Refresh
			86400			; Retry
			2419200		; Expire
			604800 )		; Negative Cache TTL
;
@	IN	NS		arjuna.f14.com.
@	IN	A		192.228.3.5		; IP LB-ARJUNA
www	IN	CNAME	arjuna.f14.com.'

echo "$config" > /etc/bind/jarkom/arjuna.f14.com

service bind9 restart