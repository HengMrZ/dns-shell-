#!/bin/bash
#rm -f invalid_bind.txt
|while read line;do
domain="www.qq.com"
#( time  dig $domain +time=3 @$line ) 2>bind.txt
dig $domain +retry=2 +time=10 @$line |grep -E -o "(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
#time=`grep real bind.txt |cut -f 2 -d 'm'|cut -f 1 -d '.'`
#if [ $time -ge 5 ];then
#( time  dig www.qq.com +time=3 @$line ) 2>bind.txt
#time_cache=`grep real bind.txt |cut -f 2 -d 'm'|cut -f 1 -d '.'`
if [ "$?" -ne 0 ];then
echo `date +'%Y-%m-%d %H:%M:%S'`  $line >>invalid_bind.txt
/usr/local/agenttools/agent/agentRepStr  36783    "Bind $line query time is $time,plz check!"
dig $domain  @$line >> query_timeout.log
fi
#fi
done
