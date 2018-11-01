#coding:utf-8
import sys
from IPy import IP

try:
    f = open('./iplist', 'r')
    for line in f.readlines():
      ipadd=line.strip()
      testip = IP(ipadd)
      with open('./aws_iplist', 'a') as g:
        for x in testip:
          g.write(str(x))
          g.write("\n")
finally:
    if f:
        f.close()
#cat  aws_iplist | awk -F . '{print $1 "." $2 "." $3 "." 0 }' |sort -u > aws_iplist_1
