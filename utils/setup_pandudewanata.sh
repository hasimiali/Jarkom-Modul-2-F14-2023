#!/bin/bash
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.228.0.0/16