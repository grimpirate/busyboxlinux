#!/bin/sh

git clone https://github.com/mirror/busybox.git

cd busybox

    make defconfig
    make menuconfig
    echo 'CONFIG_STATIC=y' >> .config
    make -j$(nproc) || exit

cd ..

KERNEL_URL=$(wget -qO- https://kernel.org | grep -Pzo 'latest_link[^>]+>[^>]+' | grep -Pao 'https:[^"]+')
KERNEL_ARCHIVE=$(echo $KERNEL_URL | grep -Po '[^/]+$')
KERNEL_DIR=$(echo $KERNEL_ARCHIVE | grep -Po '^[^\d]+([^\d]\d+)+')

wget $KERNEL_URL

tar -xf $KERNEL_ARCHIVE
rm $KERNEL_ARCHIVE

cd $KERNEL_DIR

    make allnoconfig
    make menuconfig
    make -j$(nproc) || exit

cd ..

mkdir -p iso/boot/grub

cd iso/boot/grub

    echo 'menuentry "grid" {' > grub.cfg
    echo '  linux /boot/bzImage' >> grub.cfg
    echo '  initrd /boot/initrd.img' >> grub.cfg
    echo '}' >> grub.cfg

cd ../../../

cp $KERNEL_DIR/arch/x86/boot/bzImage ./iso/boot

mkdir initrd

cd initrd

    mkdir -p bin proc sys

    cp ../busybox/busybox ./bin

    echo '#!/bin/busybox sh' > init
    echo '/bin/busybox mkdir -p /usr/sbin /usr/bin /sbin /bin' >> init
    echo '/bin/busybox --install -s' >> init

    echo 'mount -t sysfs none /sys' >> init
    echo 'mount -t proc none /proc' >> init
    echo 'sysctl -w kernel.printk="2 4 1 7"' >> init
    echo 'clear' >> init
    echo "setsid sh -c 'exec sh </dev/tty1 >/dev/tty1 2>&1'" >> init
    echo 'reboot -f' >> init

    chmod +x init

    find . | cpio -H newc -o > ../iso/boot/initrd.img

cd ..

grub-mkrescue -o grid.iso iso

rm -rf initrd
rm -rf iso

qemu-system-x86_64 -boot d -cdrom grid.iso

#qemu-system-x86_64 -kernel iso/boot/bzImage -initrd iso/boot/initrd.img
