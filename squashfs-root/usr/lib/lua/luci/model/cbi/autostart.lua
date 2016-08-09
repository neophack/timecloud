require("luci.sys")

m = Map("autostart", translate("AutoStart"), translate("开机自启动选项，重启下载宝生效"))
 
s = m:section(TypedSection, "autostart", "")
s.addremove = false
s.anonymous = true
 
apm = s:option(Flag, "apm", translate("禁止硬盘磁头复位"))
nfs = s:option(Flag, "nfs", translate("NFS服务器"))
syncy = s:option(Flag, "syncy", translate("百度云同步"))
tr = s:option(Flag, "tr", translate("Transmission"))
ngrok = s:option(Flag, "ngrok", translate("Ngrok内网穿透"))
ftp = s:option(Flag, "ftp", translate("FTP服务器"))
smb = s:option(Flag, "smb", translate("启用Samba验证"))
smbpwd = s:option(Value, "smbpwd", translate("Samba密码(用户root)"))

return m