#!/bin/bash

# 设置网络接口
setup-interfaces

# 启用eth0接口
ifup eth0

# 设置DNS
echo "nameserver 8.8.8.8" > $PREFIX/etc/resolv.conf

# 下载快速安装系统的答案文件
wget https://gist.githubusercontent.com/oofnikj/e79aef095cd08756f7f26ed244355d62/raw/answerfile -O answerfile

# 开机时输出讯息到控制台
sed -i -E 's/(local kernel_opts)=.*/\1="console=ttyS0"/' /sbin/setup-disk

# 安装系统至硬盘
setup-alpine -f answerfile

# 关机
poweroff
