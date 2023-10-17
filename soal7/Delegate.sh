#!/bin/bash
option="options {
        directory \"/var/cache/bind\";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0\'s placeholder.

        // forwarders {
        //      0.0.0.0;
        // };

        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        //dnssec-validation auto;
	    allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};"

echo "$option" > /etc/bind/named.conf.options

zone="zone \"arjuna.f14.com\" {
	type slave;
    masters { 192.228.1.3; }; // IP YudhistiraDNSMaster
	file \"/etc/bind/jarkom/arjuna.f14.com\";
};

zone \"abimanyu.f14.com\" {
	type slave;
    masters { 192.228.1.3; }; // IP YudhistiraDNSMaster
	file \"/etc/bind/jarkom/abimanyu.f14.com\";
};

zone \"3.228.192.in-addr.arpa\" {
	type slave;
    masters { 192.228.1.3; }; // IP YudhistiraDNSMaster
	file \"/etc/bind/jarkom/3.228.192.in-addr.arpa\";
};

zone \"baratayuda.abimanyu.f14.com\" {
    type master;
    file \"/etc/bind/delegasi/baratayuda.abimanyu.f14.com\";
};"

echo "$zone" > /etc/bind/named.conf.local

mkdir /etc/bind/delegasi
cp /etc/bind/db.local /etc/bind/delegasi/baratayuda.abimanyu.f14.com

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
www IN  CNAME   baratayuda.abimanyu.f14.com.'

echo "$conf" > /etc/bind/delegasi/baratayuda.abimanyu.f14.com

service bind9 restart