# Fedora-RISCV-Builder

## Getting Started

### Supported Devices

* [LicheePi-4A](./doc/install-guild-licheepi4a.md)

* Milk-V Duo

* Starfive Visionfive 2

* QEMU

### Build Manually

1.  LicheePi 4A

```
git clone https://github.com/chainsx/fedora-riscv-builder.git && cd fedora-riscv-builder
bash build_lpi4a.sh
```

2.  Milk-V Duo

```
git clone https://github.com/chainsx/fedora-riscv-builder.git && cd fedora-riscv-builder
bash build_milkv-duo.sh
```

3.  Starfive Visionfive 2

```
git clone https://github.com/chainsx/fedora-riscv-builder.git && cd fedora-riscv-builder
bash build_visionfive2.sh
```


4.  QEMU

```
git clone https://github.com/chainsx/fedora-riscv-builder.git && cd fedora-riscv-builder
bash build_qemu.sh
```

### Download Pre-built Systems

[Release](https://github.com/chainsx/fedora-riscv-builder/releases)

* Username: `root`
* Password: `fedora`

----

### Instructions

The project requires a file named `fedora-38-core-rootfs.tar.gz` to be built using a Fedora 38 host with the RISC-V architecture. The build process is as follows. If you do not wish to build it yourself, you can use the pre-built file provided by the project.

```
sudo su
mkdir /tmp/riscvroot && cd /tmp/riscvroot
WORKDIR=$(pwd)

mkdir -p $WORKDIR/etc/yum.repos.d/

cat > $WORKDIR/etc/yum.repos.d/fedora-riscv-koji.repo << EOF
[fedora-riscv-koji]
name=Fedora RISC-V Koji
baseurl=http://fedora.riscv.rocks/repos/f38-build/latest/riscv64
enabled=0
gpgcheck=0

[fedora-riscv]
name=Fedora RISC-V
baseurl=http://fedora.riscv.rocks/repos-dist/f38/latest/riscv64
#baseurl=https://dl.fedoraproject.org/pub/alt/risc-v/repo/fedora/f39/latest/riscv64/ 1
#baseurl=https://mirror.math.princeton.edu/pub/alt/risc-v/repo/fedora/f39/latest/riscv64/
enabled=1
gpgcheck=0

[fedora-riscv-debuginfo]
name=Fedora RISC-V - Debug
baseurl=http://fedora.riscv.rocks/repos-dist/f38/latest/riscv64/debug
#baseurl=https://dl.fedoraproject.org/pub/alt/risc-v/repo/fedora/f39/latest/riscv64/debug/
#baseurl=https://mirror.math.princeton.edu/pub/alt/risc-v/repo/fedora/f39/latest/riscv64/debug/
enabled=0
gpgcheck=0

[fedora-riscv-source]
name=Fedora RISC-V - Source
baseurl=http://fedora.riscv.rocks/repos-dist/f38/latest/src
#baseurl=https://dl.fedoraproject.org/pub/alt/risc-v/repo/fedora/f39/latest/src/
#baseurl=https://mirror.math.princeton.edu/pub/alt/risc-v/repo/fedora/f39/latest/src/
enabled=0
gpgcheck=0

EOF

dnf -y --repo=fedora-riscv --releasever=38 --forcearch=riscv64 --installroot=$WORKDIR install dnf fedora-release-38
dnf --installroot=$WORKDIR clean all

cd $WORKDIR
tar -zcvf fedora-38-core-rootfs.tar.gz .
```

This way, you will obtain the `fedora-38-core-rootfs.tar.gz` file required for the project script in the `/root` directory.

## Reference && Thanks

[fedora.riscv.rocks](http://fedora.riscv.rocks)
