#!/bin/bash
LOG=check.log
id=1069416
logging()
{
    msg=$@
    echo "[`date +'%Y-%m-%d %H:%M:%S'`] $msg" >> $LOG
}

cat iplist |while read line;do
loss_rate=`ping -c 100 -f $line|grep 'packet loss'|cut -f 3 -d ','|cut -f 1 -d '%'|awk '{print $1}'`
if [ "$loss_rate" -gt 90  ];then
logging "$line loss rate is $loss_rate %,plz check!"
/usr/local/agenttools/agent/agentRepStr    "$id"  "$line loss rate  is $loss_rate %,plz check!"
fi
done
