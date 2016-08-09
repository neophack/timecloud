module("luci.controller.autostart", package.seeall)

function index()
	entry({"admin", "services", "autostart"}, cbi("autostart"), _("开机自启动"))
end
