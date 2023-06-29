qemu-system-riscv64 -machine virt -nographic \
-smp 8,cores=8,threads=1,sockets=1 -m 2G \
-bios fw_jump.bin \
-kernel u-boot-nodtb.bin \
-drive file=rootfs.img,format=raw,id=hd0 \
-device virtio-blk-device,drive=hd0 \
-audiodev pa,id=snd0 \
-object rng-random,filename=/dev/urandom,id=rng0 \
-device virtio-rng-device,rng=rng0 \
-device virtio-net-device,netdev=usernet \
-netdev user,id=usernet \
-device qemu-xhci -usb -device usb-kbd -device usb-tablet -device usb-audio,audiodev=snd0