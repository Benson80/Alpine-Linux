#!/bin/bash

# 下载快速安装系统的答案文件
wget https://gist.githubusercontent.com/oofnikj/e79aef095cd08756f7f26ed244355d62/raw/answerfile -O answerfile

# 开机时输出讯息到控制台
sed -i -E 's/(local kernel_opts)=.*/\1="console=ttyS0"/' /sbin/setup-disk

# 安装系统至硬盘
setup-alpine -f answerfile

# 关机
poweroff
