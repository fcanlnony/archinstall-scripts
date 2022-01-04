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
systemctl enable dhcpcd
pacman -S intel-ucode grub efibootmgr
read -p 'enter your efi_system_partition' efi_system_partition
echo mount >> grub.sh  $efi_system_partition /boot
echo '
mkdir /boot/EFI
grub-install --efi-directory=/boot/EFI
grub-mkconfig -o /boot/grub/grub.cfg ' >> grub.sh
chmod +x grub.sh
bash ./grub.sh
