#!/bin/bash
conf=';
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	baratayuda.abimanyu.f14.com. root.baratayuda.abimanyu.f14.com. (
			2023101101	; Serial
			604800		; Refresh
			86400		; Retry
			2419200		; Expire
			604800 )	; Negative Cache TTL
;
@	IN	NS	baratayuda.abimanyu.f14.com.
@	IN	A	192.228.3.2	; IP AbimanyuWebServer
www IN  CNAME   baratayuda.abimanyu.f14.com.
rjp	IN	A	192.228.3.2	; IP AbimanyuWebServer
www.rjp IN	CNAME	rjp.baratayuda.abimanyu.f14.com.
@	IN	AAAA	::1'

echo "$conf" > /etc/bind/delegasi/baratayuda.abimanyu.f14.com

service bind9 restart