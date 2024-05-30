#!/bin/bash

# 创建run.sh脚本
cat << 'EOF' > run.sh
#!/bin/bash

qemu-system-x86_64 -machine q35 -m 1024 -smp cpus=2 -cpu qemu64 \
  -drive if=pflash,format=raw,read-only=on,file=$PREFIX/share/qemu/edk2-x86_64-code.fd \
  -netdev user,id=n1,hostfwd=tcp::2222-:22,hostfwd=tcp::8081-:80 -device virtio-net,netdev=n1 \
  -drive file=alpine.img,if=virtio \
  -boot order=c \
  -nographic
EOF

# 赋予run.sh可执行权限
chmod +x run.sh

# 运行run.sh脚本
./run.sh
