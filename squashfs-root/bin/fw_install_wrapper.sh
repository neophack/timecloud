#!/bin/sh

echo "args cnt $#"
echo "args is  [$@]"

export firmware_bin=""
export firmware_md5=""
export from_version=""
export to_version=""
export entry_trigger=""

while getopts "b:t:f:m:e:" arg
do
    case ${arg} in
    b)
        firmware_bin=${OPTARG}
        echo "firmware binary is ${firmware_bin}"
        ;;
    t)
        to_version=${OPTARG}
        echo "to version is ${to_version}"
        ;;
    f)
        from_version=${OPTARG}
        echo "from version is ${from_version}"
        ;;
    m)
        firmware_md5=${OPTARG}
        echo "firmware md5 is ${firmware_md5}"
        ;;
    e)
        entry_trigger=${OPTARG}
        echo "entry trigger is ${entry_trigger}"
        ;;
    ?)
        echo "unknown option"
        exit 1
        ;;
    esac
done

if [ "${firmware_bin}" == "" ]; then
    echo "usage: $0 -b firmware-bin [-f from-version] [-t to-version] [-m firmware-md5] -e entry"
    exit 1
fi

if [ "${entry_trigger}" == "" ]; then
    echo "usage: $0 -b firmware-bin [-f from-version] [-t to-version] [-m firmware-md5] -e entry"
    exit 1
fi

echo "entry tigger is ${entry_trigger}"

export entry_trigger="-e ${entry_trigger}"

if [ ! -f ${firmware_bin} ]; then
    echo "firmware file not exit, ${firmware_bin}"
    exit 2
fi

echo "firmware bin is ${firmware_bin}"

export firmware_bin="-b ${firmware_bin}"

echo "firmware md5 is ${firmware_md5}"
if [ "${firmware_md5}" != "" ]; then
    export firmware_md5="-m ${firmware_md5}"
fi

if [ "${from_version}" == "" ]; then
    # get the from version
    if [ ! -f /etc/firmware ]; then
        echo "may not a xiazaibao firmware"
        from_version="x.x.x"
    else
        from_version=`grep "CURVER" /etc/firmware | awk -F= '{ print $2 }'`
        if [ "${from_version}" == "" ]; then
            echo "can not get current version"
            from_version="0.0.0"
        fi
    fi
fi

echo "from version is ${from_version}"
export from_version="-f ${from_version}"

echo "to   version is ${to_version}"
if [ "${to_version}" != "" ]; then
    export to_version="-t ${to_version}"
fi

. /lib/functions.sh
. /lib/upgrade/common.sh

kill_remaining SIGTERM
sync
sleep 2
kill_remaining SIGKILL
sync
/bin/umountall /dev/sd

echo 1 > /sys/class/leds/timecloud-led-orange-flush/brightness  

run_ramfs '. /lib/functions.sh; include /lib/upgrade; do_fw_install'
