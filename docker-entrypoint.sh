#!/bin/sh

if [ ! -d '/var/run/sshd' ]; then
    mkdir -p /var/run/sshd
fi

if [ ! -f "/etc/ssh/ssh_host_ed25519_key" ]; then
    ssh-keygen -f "/etc/ssh/ssh_host_ed25519_key" -N '' -t ed25519
fi

if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
    ssh-keygen -f "/etc/ssh/ssh_host_rsa_key" -N '' -t rsa
fi

exec "$@"
