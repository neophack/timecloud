#!/bin/sh

xl_reject_hdisk()
{
    #kill&save data
	/etc/init.d/appmsh     stop
	/etc/init.d/xctlsh     stop
	/etc/init.d/lighttpdsh stop
	/etc/init.d/mpssh      stop
	/etc/init.d/etmsh      stop
	
	/etc/waittime.sh close &
	/etc/init.d/samba  stop
	sleep 2
	sync
	
	/bin/umountall /dev/sd
	
	# after state
	# white --> orange light on
	echo 0 > /sys/class/leds/timecloud-led-orange/brightness
	
	/etc/init.d/xctlsh	start &
	/etc/init.d/etmsh	start &
	/etc/init.d/mpssh	start &
	/etc/init.d/lighttpdsh	start &
	/etc/init.d/appmsh	start &
	 [ -f /tmp/quick_umount ] ||  touch /tmp/quick_umount
}

xl_factory_reset()
{
	frt=`date`
	logger "${frt} factory reset"
	echo 1 > /sys/class/leds/timecloud-led-orange-flush/brightness
	/bin/resetboot -e
	find /data -type f -name i4dlna.db -o -name etm.db |xargs rm -f	
	sync 
	mtd erase rootfs_data && jffs2mark -y
	sync
	reboot -f
}

case $1 in
	reject_hdisk)
		xl_reject_hdisk
		;;
	factory_reset)
		xl_factory_reset
		;;
	*)
		echo "Usage: x9app.sh [reject_hdisk|factory_reset]"
		;;
esac

