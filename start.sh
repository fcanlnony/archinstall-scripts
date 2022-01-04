#/bin/bash
#/bin/bash
echo 'Welcome to Arch GNU/Linux install scripts'
timedatectl set-ntp true
echo 'warring!partition look like /dev/sdx'
read -p 'enter your root_partition : ' root_partition
mkfs.ext4 $root_partition
echo mount >> archinstall.sh $root_partition /mnt
read -p 'enter your swap_partition : ' swap_partition
echo mkswap >> archinstall.sh $swap_partition 
echo swapon >> archinstall.sh $swap_partition
read -p 'enter your efi_system_partition : ' efi_system_partition
echo mount >> archinstall.sh  $efi_system_partition /mnt/boot
echo "
cp -f ./mirrorlist /etc/pacman.d/mirrorlist
pacman -Syy " >> archinstall.sh
read -p "enter another package" another_package
echo 'pacstrap /mnt base linux linux-firmware base-devel grub dhcpcd' >> archinstall.sh $another_package
echo 'genfstab -U /mnt >> /mnt/etc/fstab
cp -f ./arch-chroot_install.sh /mnt/continue
arch-chroot /mnt' >> archinstall.sh
chmod +x archinstall.sh
./archinstall.sh
