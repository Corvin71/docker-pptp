#!/bin/bash
set -e

#set iptables
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

#launch command
exec "$@"
