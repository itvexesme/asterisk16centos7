#!/bin/bash

set -m

# Asterisk (as foreground)
cd /etc/asterisk
asterisk -f &


# sshd (as background)
/usr/sbin/sshd -D &

fg %1
