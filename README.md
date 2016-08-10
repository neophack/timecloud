<<<<<<< HEAD
# timecloud
  迅雷下载宝 openwrt
#bnosereg的下载宝固件解包
  【6-10更新】迅雷下载宝官方定制固件（Luci界面+NFS+PT+FTP+smb验证+百度云+Ngrok）主机名	xiazaibao
  ```
    主机型号	XunLei Time Cloud Board
    固件版本	PandoraBox 14.09 d414a24bb66c66e2a7f30328b0bbded8cf10a05b / LuCI Trunk (0.12+svn-r1024)
    内核版本	3.14.51
   ```
#解包打包说明
基于 bnosereg 的下载宝固件 。并使用 [@neophack](https://github.com/neophack) 的 [firmware-tools](https://github.com/neophack/firmware-tools) 工具进行解包，若需要打包，则需要这里的版本：[firmware-tools](https://github.com/neophack/firmware-tools).

```bash
# 由于 git 不能索引空目录，所以必须还原空目录
mkdir -p \
	squashfs-root/dev/ \
	squashfs-root/etc/crontabs \
	squashfs-root/lib/uci/upload \
	squashfs-root/mnt/ \
	squashfs-root/overlay/ \
	squashfs-root/proc/ \
	squashfs-root/root/ \
	squashfs-root/sys/ \
	squashfs-root/tmp/ \
	squashfs-root/usr/lib/lua/luci/model/cbi/admin_services/ \
	squashfs-root/usr/lib/opkg/lists/ \
	squashfs-root/usr/share/dbus-1/services/ \
	squashfs-root/usr/share/dbus-1/session.d/ \
	squashfs-root/usr/share/dbus-1/system.d/ \
	squashfs-root/usr/share/dbus-1/system-services/

# 打包
openwrt-repack.sh -R pandorabox.bin
```
=======
#timecloud
>>>>>>> 4dbd19e337becec1976c9efdc115720e4db2b70e
