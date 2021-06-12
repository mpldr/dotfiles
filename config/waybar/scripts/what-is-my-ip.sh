#!/bin/sh

ip=$(curl https://moritz.sh/ip 2>/dev/null ) 

if [ $? -ne 0 ]; then
	ip=$(curl https://moritz.sh/ip 2>/dev/null)
fi

if [ $? -eq 0 ]; then
	echo {\"text\": \"$ip\",\"alt\":\"connected\",\"class\":\"success-text\"}
else
	echo {\"text\": \"\(┛✧Д✧\)┛ ┻━┻\",\"alt\":\"\",\"class\":\"critical-text\"}
fi
