# Alpine-Linux
Termux自动安装Alpine Linux
`answerfile` 文件是用于在 Alpine Linux 安装过程中自动配置系统的配置文件。每一行代表安装过程中的一个选项配置，详细解释如下：

1. **KEYMAPOPTS="us us"**
   - 设置键盘布局为美国标准（us）。
2. **HOSTNAMEOPTS="-n alpine"**
   - 设置主机名为 `alpine`。
3. **INTERFACESOPTS=...**
   - 配置网络接口。具体配置如下：
     - `auto lo`：自动启动 `lo`（本地回环）接口。
     - `iface lo inet loopback`：设置 `lo` 接口使用回环地址。
     - `auto eth0`：自动启动 `eth0` 接口。
     - `iface eth0 inet dhcp`：配置 `eth0` 接口使用 DHCP 获取 IP 地址。
     - `hostname alpine`：设置 DHCP 客户端的主机名为 `alpine`。
     - `dns-nameservers 8.8.8.8 8.8.4.4`：设置 DNS 服务器为 Google 的公共 DNS 服务器。
4. **TIMEZONEOPTS="-z Asia/Shanghai"**
   - 设置时区为 `Asia/Shanghai`（上海）。
5. **PROXYOPTS="none"**
   - 不使用代理服务器。
6. **APKREPOSOPTS="http://dl-cdn.alpinelinux.org/alpine/v3.20/main http://dl-cdn.alpinelinux.org/alpine/v3.20/community"**
   - 设置软件包仓库的 URL，分别为主仓库和社区仓库的地址。
7. **SSHDOPTS="-c openssh"**
   - 安装并配置 OpenSSH 服务器。
8. **NTPOPTS="-c busybox"**
   - 使用 BusyBox 的 NTP 客户端同步时间。
9. **DISKOPTS="-v -m sys -s 0 /dev/vda"**
   - 配置磁盘选项：
     - `-v`：详细输出。
     - `-m sys`：安装系统模式。
     - `-s 0`：指定分区大小为 0（表示使用整个磁盘）。
     - `/dev/vda`：目标磁盘设备为 `/dev/vda`。

总结来说，这个 `answerfile` 自动化了键盘布局、主机名、网络配置、时区、包仓库、SSH 服务、NTP 时间同步以及磁盘分区等设置，使得 Alpine Linux 可以在无需人工干预的情况下进行安装和初始配置。
