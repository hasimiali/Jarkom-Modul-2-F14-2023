#!/bin/bash
zone="zone \"arjuna.f14.com\" {
	type slave;
    masters { 192.228.2.3; }; // IP YudhistiraDNSMaster
	file \"/etc/bind/jarkom/arjuna.f14.com\";
};

zone \"abimanyu.f14.com\" {
	type slave;
    masters { 192.228.2.3; }; // IP YudhistiraDNSMaster
	file \"/etc/bind/jarkom/abimanyu.f14.com\";
};

zone \"3.228.192.in-addr.arpa\" {
	type slave;
    masters { 192.228.2.3; }; // IP YudhistiraDNSMaster
	file \"/etc/bind/jarkom/3.228.192.in-addr.arpa\";
};"

echo "$zone" > /etc/bind/named.conf.local

service bind9 restart