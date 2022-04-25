#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "Ky script duhet te ekzekutohet si user root, ju lutem perdorni "sudo"
   exit 1
fi

sed -i -e 's|SHELL=/bin/sh|SHELL=/bin/bash|' /etc/default/useradd &>/dev/null
sed -i -e 's|# HOME=/home|HOME=/home|' /etc/default/useradd &>/dev/null
sed -i -e 's|# SKEL=/etc/skel|SKEL=/etc/skel|' /etc/default/useradd &>/dev/null
sed -i -e 's|PasswordAuthentication no|PasswordAuthentication yes|' /etc/ssh/sshd_config &>/dev/null
sed -i -e 's|ChallengeResponseAuthentication no|ChallengeResponseAuthentication yes|' /etc/ssh/sshd_config &>/dev/null
systemctl restart sshd.service

echo "Ju lutem fusni emrin e userit te cilin doni te shtoni ne sistem :"

read user
grep -q $user /etc/passwd
if [ $? -ne 0 ]; then
      useradd -m $user
      usermod -aG sudo $user
      passwd $user
else
        echo "Useri me kete emer ekziston, ju lutem provo perseri"
fi
