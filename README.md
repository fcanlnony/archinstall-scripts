# archinstall-scripts
Semi-automated script
non-stable(testing...)

# Preface
You should partition in advance in order to mount

# First
 pacman -Syy && pacman -S git
 git clone https://github.com/fcanlnony/archinstall-scripts.git
 cd archinstall-scripts
 chmod +x ./*
 ./start.sh

# After chroot
 chmod +x continue
 ./continue
