#!/bin/bash

# 更新软件包索引并升级已安装的软件包
pkg update && pkg upgrade -y

# 安装必要的软件包
pkg install qemu-utils qemu-common qemu-system-x86_64-headless -y
pkg install wget -y
pkg install openssl -y

# 创建并进入alpine目录
mkdir alpine && cd alpine

# 下载Alpine Linux ISO文件
#wget https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/x86_64/alpine-virt-3.20.0-x86_64.iso
wget https://benson80.eu.org/x86_64/alpine-virt-3.20.0-x86_64.iso

# 创建10G的qcow2镜像文件
qemu-img create -f qcow2 alpine.img 10G

# 创建run.sh脚本
cat << 'EOF' > run.sh
#!/bin/bash

qemu-system-x86_64 -machine q35 -m 1024 -smp cpus=2 -cpu qemu64 \
  -drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
  -netdev user,id=n1,hostfwd=tcp::2222-:22 -device virtio-net,netdev=n1 \
  -cdrom alpine-virt-3.20.0-x86_64.iso \
  -drive file=alpine.img,if=virtio \
  -nographic
EOF

# 赋予run.sh可执行权限
chmod +x run.sh

# 运行run.sh脚本
./run.sh
