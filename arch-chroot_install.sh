#/bin/bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
echo 'arch' >> /etc/hostname
echo '
127.0.0.1localhost
::1		localhost
127.0.1.1	arch.localdomain	arch' >> /etc/hosts
echo 'enter your root password'
passwd
grub-install --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable dhcpcd
