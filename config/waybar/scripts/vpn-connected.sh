#!/bin/sh

ls /sys/devices/virtual/net/$1 &> /dev/null

if [ $? -eq 0 ]; then
	echo "{\"text\": \"$2\",\"alt\":\"active\",\"class\":\"$3\"}"
else
	echo {\"text\": \"$4\",\"alt\":\"\",\"class\":\"$5\"}
fi
