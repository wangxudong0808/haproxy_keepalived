#!/bin/bash

statu=0
for i in $(seq 3)
do
        netstat -tlnup | grep haproxy &>/dev/null
        if [ $? -ne 0 ]
        then
                statu=$((statu+1))
        fi
done
echo "$statu"
if [ $statu -eq 3 ]
then
        killall keepalived
fi
